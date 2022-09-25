import Foundation

struct ClassUserResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case profileImageUrlString = "profile_image_url"
        case num
        case name
    }
    let profileImageUrlString: String
    let num: Int
    let name: String
}

extension ClassUserResponse {
    func toDomain() -> ClassUserEntity {
        return .init(
            profileImageUrl: URL(string: profileImageUrlString)!,
            num: num,
            name: name
        )
    }
}
