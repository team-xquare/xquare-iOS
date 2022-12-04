import Foundation

import RxSwift
import Combine
import ComposableArchitecture

public class SignupUseCase {

    private let authRepository: AuthRepository
    private var disposeBag = DisposeBag()

    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }

    public func excute(data: SignupEntity) -> Future<Void, AuthServiceError> {
        return Future<Void, AuthServiceError> { promise in
            self.authRepository.signup(signupEntity: data)
                .subscribe(onCompleted: {
                    promise(.success(()))
                }, onError: { error in
                    promise(.failure(error as? AuthServiceError ?? .networkNotWorking))
                })
                .disposed(by: self.disposeBag)
        }
    }

}
