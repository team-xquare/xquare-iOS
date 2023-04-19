import Foundation

import RxSwift

public class LogoutUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return self.repository.logout()
    }
}
