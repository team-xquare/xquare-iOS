import Foundation

import RxSwift

public class FetchUserPointUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(users: [String]) -> Single<UserPointEntity> {
        return repository.fetchUserPoint(users: users)
    }
}
