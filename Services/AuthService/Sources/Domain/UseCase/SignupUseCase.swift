import Foundation

import RxSwift

public class SignupUseCase {

    private let authRepository: AuthRepository

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute(data: SignupEntity) -> Completable {
        self.authRepository.signup(signupEntity: data)
    }

}
