import Foundation

struct SigninRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case id       = "account_id"
        case password = "password"
        case deviceToken = "device_token"
    }

    let id: String
    let password: String
    let deviceToken: String

}
