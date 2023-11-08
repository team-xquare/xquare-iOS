import Foundation

import UIKit
import AttachmentService
import UserService
import XDateUtil
import RxSwift
import AuthService
import GithubService

class MyPageViewModel: ObservableObject {
    @Published var profileImage = UIImage()
    @Published var profileImagrUrl: URL?
    @Published var name: String = ""
    @Published var birthDay: String = ""
    @Published var gradeClassNum: String = ""
    @Published var id: String = ""
    @Published var xPhotosIsPresented: Bool = false
    @Published var profileImageString: String = ""
    @Published var showLogoutAlert: Bool = false
    @Published var isOverStorage: Bool = false
    @Published var isGithubLinking: Bool = true
    @Published var showLinkingErrorAlert: Bool = false
    var selectProfileImage = UIImage()

    private let fetchProfileUseCase: FetchProfileUseCase
    private let editProfileImageUseCase: EditProfileImageUseCase
    private let requestPresignedUrlUseCase: RequestPresignedUrlUseCase
    private let uploadImageToS3UseCase: UploadImageToS3UseCase
    private let logoutUseCase: LogoutUseCase
    private let registerGithubIDUseCase: RegisterGithubIDUseCase
    private let checkGithubConnectingUseCase: CheckGithubConnectingUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        editProfileImageUseCase: EditProfileImageUseCase,
        requestPresignedUrlUseCase: RequestPresignedUrlUseCase,
        uploadImageToS3UseCase: UploadImageToS3UseCase,
        logoutUseCase: LogoutUseCase,
        registerGithubIDUseCase: RegisterGithubIDUseCase,
        checkGithubConnectingUseCase: CheckGithubConnectingUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.editProfileImageUseCase = editProfileImageUseCase
        self.requestPresignedUrlUseCase = requestPresignedUrlUseCase
        self.uploadImageToS3UseCase = uploadImageToS3UseCase
        self.logoutUseCase = logoutUseCase
        self.registerGithubIDUseCase = registerGithubIDUseCase
        self.checkGithubConnectingUseCase = checkGithubConnectingUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .subscribe(onSuccess: {
                self.name = $0.name
                self.gradeClassNum = "\($0.grade)학년 \($0.classNumber)반 \($0.number)번"
                self.birthDay = $0.birthDay.toString(format: "yyyy년 M월 d일")
                self.id = $0.id
                self.profileImagrUrl = $0.imageUrl
            })
            .disposed(by: disposeBag)
    }

    func uploadImage() {
        let imageData = self.selectProfileImage.jpegData(compressionQuality: 0.3) ?? Data()
        guard imageData.count / 1048576 < 10 else {
            self.isOverStorage = true
            return
        }
        self.requestPresignedUrlUseCase
            .excute(files: [imageData])
            .subscribe(
                with: self,
                onSuccess: { owner, datas in
                    owner.uploadImageToS3(presignedDatas: datas, imageDatas: [imageData])
                }
            )
            .disposed(by: disposeBag)
    }

    private func uploadImageToS3(presignedDatas: [PresigedUrlEntity], imageDatas: [Data]) {
        self.uploadImageToS3UseCase
            .excute(presigedDatas: presignedDatas, imageDatas: imageDatas)
            .subscribe(
                with: self,
                onCompleted: { owner in
                    owner.editProfileImage(imageUrl: presignedDatas[0].url)
                    owner.profileImage = owner.selectProfileImage
                }
            )
            .disposed(by: disposeBag)
    }

    private func editProfileImage(imageUrl: String) {
        self.editProfileImageUseCase.excute(profileImage: imageUrl)
            .subscribe(onCompleted: { })
            .disposed(by: disposeBag)
    }

    func checkGithubConnecting() {
        self.checkGithubConnectingUseCase.execute()
            .subscribe(onNext: {
                self.isGithubLinking = $0.isConnected
            })
            .disposed(by: disposeBag)
    }

    func withdrawal() {
        self.logoutUseCase.excute()
            .subscribe(onCompleted: { })
            .disposed(by: disposeBag)
    }

    func registerGithubID(callbackURL: URL) {
        guard isAbleURL(url: callbackURL) else {
            self.showLinkingErrorAlert = true
            return
        }
        self.registerGithubIDUseCase.execute(code: toCallbackCode(callbackURL: callbackURL))
            .subscribe(
                onCompleted: { self.isGithubLinking = true },
                onError: {
                    self.showLinkingErrorAlert = true
                    print($0.localizedDescription)
                }
            )
            .disposed(by: disposeBag)
    }

    private func isAbleURL(url: URL) -> Bool {
        guard url.scheme! == "xquare" && url.host! == "callback" else {
            return false
        }
        return true
    }

    private func toCallbackCode(callbackURL: URL) -> String {
        let urlString = callbackURL.absoluteString
        let contents = urlString.components(separatedBy: "=")
        return contents[1]
    }
}
