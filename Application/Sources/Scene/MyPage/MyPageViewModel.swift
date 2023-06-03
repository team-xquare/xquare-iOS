import Foundation

import UIKit
import AttachmentService
import UserService
import XDateUtil
import RxSwift
import AuthService

class MyPageViewModel: ObservableObject {
    @Published var profileImage = UIImage()
    @Published var profileImagrUrl: URL?
    @Published var name: String = ""
    @Published var birthDay: String = ""
    @Published var gradeClassNum: String = ""
    @Published var id: String = ""
    @Published var xPhotosIsPresented: Bool = false
    @Published var profileImageString: String = ""
    @Published var showQuitAlert: Bool = false
    @Published var showLogoutAlert: Bool = false

    private let fetchProfileUseCase: FetchProfileUseCase
    private let editProfileImageUseCase: EditProfileImageUseCase
    private let uploadImageUseCase: UploadImageUseCase
    private let logoutUseCase: LogoutUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        editProfileImageUseCase: EditProfileImageUseCase,
        uploadImageUseCase: UploadImageUseCase,
        logoutUseCase: LogoutUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.editProfileImageUseCase = editProfileImageUseCase
        self.uploadImageUseCase = uploadImageUseCase
        self.logoutUseCase = logoutUseCase
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
        self.uploadImageUseCase
            .excute(files: [self.profileImage.jpegData(compressionQuality: 0.5) ?? Data()])
            .subscribe(onSuccess: {
                self.editProfileImage(imageUrl: $0[0])
            })
            .disposed(by: disposeBag)
    }

    private func editProfileImage(imageUrl: String) {
        self.editProfileImageUseCase.excute(profileImage: imageUrl)
            .subscribe(onCompleted: {
            })
            .disposed(by: disposeBag)
    }

    func withdrawal() {
        self.logoutUseCase.excute()
            .subscribe(onCompleted: { })
            .disposed(by: disposeBag)
    }
}
