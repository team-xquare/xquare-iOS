import Foundation

import RxSwift

public class FetchUserInformationByNameUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(accountId: String) -> Single<UserEntity> {
        return repository.fetchUserInformationByName(accountId: accountId)
    }
}
