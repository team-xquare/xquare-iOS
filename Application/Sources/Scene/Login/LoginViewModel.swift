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
    private let fetchIdAndPasswordUseCase: FetchIdAndPasswordUseCase

    private var disposeBag = DisposeBag()

    init(
        signInUseCase: SigninUseCase,
        fetchIdAndPasswordUseCase: FetchIdAndPasswordUseCase
    ) {
        self.signInUseCase = signInUseCase
        self.fetchIdAndPasswordUseCase = fetchIdAndPasswordUseCase
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

    func checkUnlock() {
        fetchIdAndPassword()
        if idAndPassword?.id ?? "" != "" && idAndPassword?.password ?? "" != "" {
            requestUnlock()
        }
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

    private func fetchIdAndPassword() {
        self.fetchIdAndPasswordUseCase.excute()
            .asObservable()
            .subscribe(onNext: { [weak self] in
                self?.idAndPassword = $0
            })
            .disposed(by: disposeBag)
    }
}
