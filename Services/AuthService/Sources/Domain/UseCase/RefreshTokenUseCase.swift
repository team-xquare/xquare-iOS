import Foundation

import RxSwift

public class RefreshTokenUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute() -> Completable {
        self.authRepository.refreshToken()
    }

}
