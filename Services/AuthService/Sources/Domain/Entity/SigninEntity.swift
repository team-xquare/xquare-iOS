import Foundation

public struct SigninEntity {
    let id: String
    let password: String
    let deviceToken: String

    public init(
        id: String,
        password: String,
        deviceToken: String
    ) {
        self.id = id
        self.password = password
        self.deviceToken = deviceToken
    }
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
