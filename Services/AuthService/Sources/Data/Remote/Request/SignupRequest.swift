import Foundation

struct SignupRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case verificationCode = "verification_code"
        case id       = "account_id"
        case profileImageUrlAsString = "profile_file_name"
        case password = "password"
    }

    let verificationCode: String
    let id: String
    let profileImageUrlAsString: String?
    let password: String

}
