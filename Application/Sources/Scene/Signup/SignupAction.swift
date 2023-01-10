import Foundation

import AuthService
import ComposableArchitecture

enum SignupAction {
    case signup
    case signupIsSuccess(Result<Void, AuthServiceError>)
    case checkPasswordIsEqual
    case checkButtonDisabled
    case binding(BindingAction<SignupState>)
    case authCodeChanged(String)
    case idChanged(String)
    case passwordChanged(String)
    case reEnterPasswordChange(String)
}
