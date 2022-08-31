import SwiftUI

import AuthService
import RxSwift

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isSuccess: Bool = false

    private let signInUseCase: SigninUseCase

    private var disposeBag = DisposeBag()

    init(signInUseCase: SigninUseCase) {
        self.signInUseCase = signInUseCase
    }

    func textFieldIsEmpty() -> Bool {
        return id.isEmpty || password.isEmpty
    }

    func login() {
        signInUseCase.excute(
            data: .init(
                id: id,
                password: password,
                deviceToken: "dsfisdofds"
            ))
        .subscribe(onCompleted: { [weak self] in
            self?.isSuccess = true
        }, onError: { [weak self] in
            if $0.asAuthServiceError == .failToSignin {
                self?.errorMessage = "아이디나 비밀번호가 일치하지 않습니다."
            }
            self?.isSuccess = false
        }).disposed(by: disposeBag)
    }
}
