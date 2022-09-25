import Foundation

import RxSwift

public class FetchUserInformationByIdUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(userId: String) -> Single<UserEntity> {
        return repository.fetchUserInformationById(userId: userId)
    }
}
