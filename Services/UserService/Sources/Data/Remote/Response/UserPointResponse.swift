import Foundation

struct UserPointResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case goodPoint = "good_point"
        case badPoint = "bad_point"
    }
    let name: String
    let goodPoint: Int
    let badPoint: Int
}

extension UserPointResponse {
    func toDomain() -> UserPointEntity {
        return .init(
            name: name,
            goodPoint: goodPoint,
            badPoint: badPoint
        )
    }
}
