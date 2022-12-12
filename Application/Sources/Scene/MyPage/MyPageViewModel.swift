import Foundation

import UIKit
import AttachmentService
import UserService
import XDateUtil
import RxSwift

class MyPageViewModel: ObservableObject {
    @Published var profileImage = UIImage()
    @Published var profileImagrUrl: URL?
    @Published var name: String = "김기영"
    @Published var birthDay: String = "2005.05.30"
    @Published var gradeClassNum: String = "2학년 1반 3번"
    @Published var id: String = "rlarldud"
    @Published var xPhotosIsPresented: Bool = false
    @Published var profileImageString: String = ""

    private let fetchProfileUseCase: FetchProfileUseCase
    private let editProfileImageUseCase: EditProfileImageUseCase
    private let uploadImageUseCase: UploadImageUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        editProfileImageUseCase: EditProfileImageUseCase,
        uploadImageUseCase: UploadImageUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.editProfileImageUseCase = editProfileImageUseCase
        self.uploadImageUseCase = uploadImageUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .subscribe(onSuccess: {
                self.name = $0.name
                self.gradeClassNum = $0.gradeClassNum
                self.birthDay = $0.birthDay.toString(format: "yyyy.MM.dd")
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
            }, onFailure: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }

    private func editProfileImage(imageUrl: String) {
        print(imageUrl)
        self.editProfileImageUseCase.excute(profileImage: imageUrl)
            .subscribe(onCompleted: {
                print("success")
            })
            .disposed(by: disposeBag)
    }
}
