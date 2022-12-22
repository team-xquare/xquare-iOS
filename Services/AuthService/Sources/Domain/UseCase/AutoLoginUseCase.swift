import Foundation

import RxSwift

public class AutoLoginUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute() -> Single<IdAndPasswordEntity> {
        return repository.autoLogin()
    }

}
