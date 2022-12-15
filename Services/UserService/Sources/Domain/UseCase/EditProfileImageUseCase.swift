import Foundation

import RxSwift

public class EditProfileImageUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(profileImage: String) -> Completable {
        return repository.editProfileImage(profileImage: profileImage)
    }
}
