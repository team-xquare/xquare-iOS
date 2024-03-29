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
    @Published var idAndPassword: IdAndPasswordEntity?

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
                deviceToken: Messaging.messaging().fcmToken ?? "mac"
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

    func checkUnlock() {
        reset()
        autoLogin()
        if idAndPassword?.id ?? "" != "" && idAndPassword?.password ?? "" != "" {
            requestUnlock()
        }
    }

    func reset() {
        self.isLoginSuccess = false
        self.id = ""
        self.password = ""
        self.errorMessage = ""
    }

    private func requestUnlock() {
        let context = LAContext()
        var error: NSError?

        let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)

        if canEvaluate {
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "To Access Data"
            ) { success, _ in
                if success {
                    self.id = self.idAndPassword?.id ?? ""
                    self.password = self.idAndPassword?.password ?? ""
                    self.login()
                }
            }
        }
    }

    private func autoLogin() {
        self.autoLoginUseCase.excute()
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.idAndPassword = $0
            })
            .disposed(by: disposeBag)
    }
}
