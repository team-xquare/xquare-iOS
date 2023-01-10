import Foundation

struct SignupState: Equatable {
    var authCode: String = ""
    var id: String = ""
    var password: String = ""
    var reEnterPassword: String = ""
    var idErrorMessage: String = ""
    var passwordErrorMessage: String = ""
    var isSuccess: Bool = false
    var isDisable: Bool = true
    var isInternetNotworking: Bool = false
}
