import Foundation

import XDateUtil

struct UserResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case birthDay = "birth_day"
        case grade
        case classNumber = "class_num"
        case profileImageUrlString = "profile_image_url"
        case password
        case accountId = "account_id"
        case num
    }
    let name: String
    let id: String
    let birthDay: String
    let grade: Int
    let classNumber: Int
    let profileImageUrlString: String
    let password: String
    let accountId: String
    let num: Int

}

extension UserResponse {
    func toDomain() -> UserEntity {
        return .init(
            name: name,
            id: id,
            birthDay: birthDay.toDate(format: .fullDate),
            grade: grade,
            classNumber: classNumber,
            profileImageUrl: URL(string: profileImageUrlString)!,
            password: password,
            accountId: accountId,
            num: num
        )
    }
}
