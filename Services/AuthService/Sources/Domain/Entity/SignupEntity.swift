import Foundation

public struct SignupEntity {
    let authCode: String
    let id: String
    let profileImageUrl: URL?
    let password: String
}
    
extension SignupEntity {
    func toSignupRequest() -> SignupRequest{
        return .init(
            authCode: self.authCode,
            id: self.id,
            profileImageUrlAsString: self.profileImageUrl?.absoluteString,
            password: self.password
        )
    }
}
