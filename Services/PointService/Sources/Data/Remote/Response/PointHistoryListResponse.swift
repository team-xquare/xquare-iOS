import Foundation

struct PointHistoryListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case pointHistories = "point_histories"
    }
    let pointHistories: [PointHistoryResponse]
}

extension PointHistoryListResponse {
    func toDomain() -> [PointHistoryEntity] {
        return pointHistories.map { $0.toDomain() }
    }
}
