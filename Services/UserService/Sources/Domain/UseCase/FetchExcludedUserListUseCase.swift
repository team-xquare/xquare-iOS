import Foundation

import RxSwift

public class FetchExcludedUserListUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(users: [String]) -> Single<UserIdsEntity> {
        return repository.fetchExcludedUserList(users: users)
    }
}
