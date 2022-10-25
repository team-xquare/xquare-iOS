import Foundation

struct UserPointResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case profileFileName = "profile_file_name"
        case goodPoint = "good_point"
        case badPoint = "bad_point"
    }
    let name: String
    let profileFileName: String?
    let goodPoint: Int
    let badPoint: Int
}

extension UserPointResponse {
    func toDomain() -> UserPointEntity {
        return .init(
            name: name,
            profileFileName: profileFileName,
            goodPoint: goodPoint,
            badPoint: badPoint
        )
    }
}
