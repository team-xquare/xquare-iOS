import Foundation

import RxSwift

public class FetchFCMTokenUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(users: [String]) -> Single<FCMTokensEntity> {
        return repository.fetchFCMToken(users: users)
    }
}
