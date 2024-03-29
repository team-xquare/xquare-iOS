import Foundation

import AuthService
import RxSwift

class SignupViewModel: ObservableObject {
    @Published var authCode: String = ""
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var reEnterPassword: String = ""
    @Published var passwordErrorMessage: String = ""
    @Published var idErrorMessage: String = ""
    @Published var isSuccess: Bool = false
    @Published var isDisabled: Bool = true
    @Published var isInternetNotWorking: Bool = false
    @Published var isServerError: Bool = false

    private let signupuseCase: SignupUseCase

    private var disposeBag = DisposeBag()

    init(signupUseCase: SignupUseCase) {
        self.signupuseCase = signupUseCase
    }

    func signup() {
        self.signupuseCase.excute(data: .init(
            authCode: authCode,
            id: id,
            profileImageUrl: nil,
            password: password
        ))
        .subscribe(onCompleted: { [weak self] in
            self?.isInternetNotWorking = false
            self?.isServerError = false
            self?.isSuccess = true
        }, onError: { [weak self] in
            if $0.asAuthServiceError == .duplicateId {
                self?.idErrorMessage = "아이디가 중복되었습니다."
            } else if $0.asAuthServiceError == .networkNotWorking {
                self?.isInternetNotWorking = true
            } else {
                self?.isServerError = true
            }
            self?.isSuccess = false
        })
        .disposed(by: self.disposeBag)
    }

    func checkSignup() {
        self.isDisabled = !isCheckAuthCode() || !isIdCheck() || !isPasswordCheck() || !isReEnterPasswordCheck()
    }

    func equalPasswordError() {
        if !isReEnterPasswordCheck() {
            self.passwordErrorMessage = "비밀번호가 일치하지 않습니다."
        } else {
            self.passwordErrorMessage = ""
        }
    }

    private func isCheckAuthCode() -> Bool {
        return authCode.count == 6
    }

    private func isIdCheck() -> Bool {
        let strRegEx = "[A-Za-z0-9]{6,20}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: self.id)
    }

    private func isPasswordCheck() -> Bool {
        let strRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: self.password)
    }

    private func isReEnterPasswordCheck() -> Bool {
        return self.password == self.reEnterPassword
    }
}
