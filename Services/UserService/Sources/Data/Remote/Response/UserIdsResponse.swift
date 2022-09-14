import Foundation

struct UserIdsResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case userIds = "user_ids"
    }
    let userIds: [String]
}

extension UserIdsResponse {
    func toDomain() -> UserIdsEntity {
        return .init(userIds: userIds)
    }
}
