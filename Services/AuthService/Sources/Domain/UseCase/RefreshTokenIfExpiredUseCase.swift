import Foundation

import RxSwift

public class RefreshTokenIfExpiredUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute() -> Completable {
        if let tokenExpiredDate = try? self.authRepository.fetchTokenExpiredDate() {
            if tokenExpiredDate <= Date() {
                return self.authRepository.refreshToken()
            } else {
                return .empty()
            }
        } else {
            return .error(AuthServiceError.noToken)
        }
    }

}
