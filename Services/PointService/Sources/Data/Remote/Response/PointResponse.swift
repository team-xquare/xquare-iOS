import Foundation

struct PointResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case goodPoint = "good_point"
        case badPoint = "bad_point"
    }
    let goodPoint: Int
    let badPoint: Int
}

extension PointResponse {
    func toDomain() -> PointEntity {
        return .init(
            goodPoint: goodPoint,
            badPoint: badPoint
        )
    }
}
