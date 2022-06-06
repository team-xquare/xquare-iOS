import Foundation

import RxSwift

public class SigninUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute(data: SigninEntity) -> Completable {
        self.authRepository.signin(signinEntity: data)
    }

}
