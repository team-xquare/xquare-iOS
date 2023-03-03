import Foundation

struct PointResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case goodPoint = "good_point"
        case badPoint = "bad_point"
        case pointHistories = "point_histories"
    }
    let goodPoint: Int
    let badPoint: Int
    let pointHistories: [PointHistoryResponse]
}

extension PointResponse {
    func toDomain() -> PointEntity {
        return .init(
            goodPoint: goodPoint,
            badPoint: badPoint,
            pointHistories: pointHistories.map { $0.toDomain() }
        )
    }
}
