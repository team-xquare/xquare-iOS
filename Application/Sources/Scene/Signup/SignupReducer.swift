import Foundation

import AuthService
import ComposableArchitecture

struct SignupReducer {

    static let reducer = AnyReducer<SignupState, SignupAction, SignupEnvironment> { state, action, environemnt in
        switch action {
        case .authCodeChanged(let authCode):
            state.authCode = authCode
            return .none
        case .idChanged(let id):
            state.id = id
            return .none
        case .passwordChanged(let password):
            state.password = password
            return .none
        case .reEnterPasswordChange(let password):
            state.reEnterPassword = password
            return .none
        case .signup:
            return environemnt.signupUseCase.excute(data: .init(
                authCode: state.authCode,
                id: state.id,
                profileImageUrl: nil,
                password: state.password
            ))
            .catchToEffect(SignupAction.signupIsSuccess)
            .eraseToEffect()
        case .signupIsSuccess(.success(let success)):
            state.isSuccess = true
            return .none
        case .signupIsSuccess(.failure(let error)):
            if error == .duplicateId {
                state.isSuccess = false
                state.idErrorMessage = "아이디가 중복되었습니다."
            } else if error == .networkNotWorking {
                state.isInternetNotworking = true
                state.isSuccess = false
            }
            return .none
        case .checkPasswordIsEqual:
            state.passwordErrorMessage = isPasswordEqual(
                state.password,
                state.reEnterPassword
            ) ? "" : "비밀번호가 일치하지 않습니다."

            return .none
        case .checkButtonDisabled:
            state.isDisable = !isPasswordEqual(
                state.password,
                state.reEnterPassword
            ) || !checkId(state.id) || !checkAuthCode(state.authCode) || !checkPassword(state.password)
            return .none
        case .binding:
            return .none
        }
    }

    private static func isPasswordEqual(_ password: String, _ reEnterPassword: String) -> Bool {
        return password == reEnterPassword
    }
    private static func checkId(_ id: String) -> Bool {
        let strRegEx = "[A-Za-z0-9]{6,20}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: id)
    }
    private static func checkPassword(_ password: String) -> Bool {
        let strRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: password)
    }
    private static func checkAuthCode(_ authCode: String) -> Bool {
        return authCode.count == 6
    }
}
