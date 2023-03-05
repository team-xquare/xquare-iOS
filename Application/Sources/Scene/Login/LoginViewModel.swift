import SwiftUI

import AuthService
import FirebaseMessaging
import LocalAuthentication
import RxSwift

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoginSuccess: Bool = false
    @Published var isInternetNotWorking: Bool = false

    private let signInUseCase: SigninUseCase
    private let autoLoginUseCase: AutoLoginUseCase

    private var disposeBag = DisposeBag()

    init(
        signInUseCase: SigninUseCase,
        autoLoginUseCase: AutoLoginUseCase
    ) {
        self.signInUseCase = signInUseCase
        self.autoLoginUseCase = autoLoginUseCase
    }

    func textFieldIsEmpty() -> Bool {
        return id.isEmpty || password.isEmpty
    }

    func login() {
        self.isInternetNotWorking = false
        signInUseCase.excute(
            data: .init(
                id: id,
                password: password,
                deviceToken: Messaging.messaging().fcmToken ?? ""
            ))
        .subscribe(onCompleted: { [weak self] in
            self?.isInternetNotWorking = false
            self?.isLoginSuccess = true
        }, onError: { [weak self] in
            if $0.asAuthServiceError == .failToSignin {
                self?.errorMessage = "아이디나 비밀번호가 일치하지 않습니다."
            } else if $0.asAuthServiceError == .networkNotWorking {
                self?.isInternetNotWorking = true
            }
            self?.isLoginSuccess = false
        }).disposed(by: disposeBag)
    }

    func fetchIdAndPassword() {
        self.autoLoginUseCase.excute()
            .asObservable()
            .subscribe(onNext: {
                self.id = $0.id
                self.password = $0.password
            })
            .disposed(by: disposeBag)
    }
}
