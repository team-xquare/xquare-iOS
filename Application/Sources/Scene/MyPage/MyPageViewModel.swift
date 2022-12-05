import Foundation

import UIKit
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

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        editProfileImageUseCase: EditProfileImageUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.editProfileImageUseCase = editProfileImageUseCase
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

    func editProfileImage() {
        self.editProfileImageUseCase.excute(profileImage: profileImageString)
            .subscribe(onCompleted: {
            })
            .disposed(by: disposeBag)
    }
}
