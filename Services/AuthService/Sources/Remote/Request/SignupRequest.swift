import Foundation

struct SignupRequest: Encodable {

    private enum CodingKeys: String, CodingKey {
        case authCode = "auth_code"
        case id       = "account_id"
        case name     = "name"
        case birthDay = "birth_day"
        case grade    = "grade"
        case classNum = "class_num"
        case number   = "num"
        case profileImageUrlAsString = "profile_image_url"
        case password = "password"
    }

    let authCode: String
    let id: String
    let name: String
    let birthDay: String
    let grade: Int
    let classNum: Int
    let number: Int
    let profileImageUrlAsString: String
    let password: String

}
