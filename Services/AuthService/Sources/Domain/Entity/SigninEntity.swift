import Foundation

public struct SigninEntity {
    let id: String
    let password: String
    let deviceToken: String
}

extension SigninEntity {
    func toSigninRequest() -> SigninRequest {
        return .init(
            id: self.id,
            password: self.password,
            deviceToken: self.deviceToken
        )
    }
}
