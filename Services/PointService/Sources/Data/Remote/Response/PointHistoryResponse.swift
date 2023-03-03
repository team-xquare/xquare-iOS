import Foundation

import XDateUtil

struct PointHistoryResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case date
        case reason
        case pointType = "point_type"
        case point
    }
    let id: String
    let date: String
    let reason: String
    let pointType: Bool
    let point: Int
}

extension PointHistoryResponse {
    func toDomain() -> PointHistoryEntity {
        return .init(
            id: id,
            date: date.toDate(format: .fullDate),
            reason: reason,
            pointType: pointType,
            point: point
        )
    }
}
