import Foundation

public struct SignupEntity {
    let authCode: String
    let id: String
    let profileImageUrl: URL?
    let password: String

    public init(
        authCode: String,
        id: String,
        profileImageUrl: URL?,
        password: String
    ) {
        self.authCode = authCode
        self.id = id
        self.profileImageUrl = profileImageUrl
        self.password = password
    }
}

extension SignupEntity {
    func toSignupRequest() -> SignupRequest {
        return .init(
            verificationCode: self.authCode,
            id: self.id,
            profileImageUrlAsString: self.profileImageUrl?.absoluteString,
            password: self.password
        )
    }
}
