import Foundation

struct SignupRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case authCode = "auth_code"
        case id       = "account_id"
        case profileImageUrlAsString = "profile_image_url"
        case password = "password"
    }

    let authCode: String
    let id: String
    let profileImageUrlAsString: String?
    let password: String

}
