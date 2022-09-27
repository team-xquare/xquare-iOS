import SwiftUI

import AuthService
import RxSwift
import FirebaseMessaging
import Network

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoginSuccess: Bool = false
    @Published var isInternetNotWorking: Bool = false

    private let signInUseCase: SigninUseCase

    private var disposeBag = DisposeBag()

    init(signInUseCase: SigninUseCase) {
        self.signInUseCase = signInUseCase
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
            self?.isLoginSuccess = true
        }, onError: { [weak self] in
            if $0.asAuthServiceError == .failToSignin {
                self?.errorMessage = "아이디나 비밀번호가 일치하지 않습니다."
            }
            self?.isLoginSuccess = false
        }).disposed(by: disposeBag)
    }
}
