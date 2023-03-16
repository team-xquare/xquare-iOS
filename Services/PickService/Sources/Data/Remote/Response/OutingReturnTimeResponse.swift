import Foundation

struct OutingReturnTimeResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case endTime = "end_time"
    }

    let userId: String
    let name: String
    let endTime: String

}

extension OutingReturnTimeResponse {
    func toDomain() -> OutingReturnTimeEntity {
        return .init(
            userId: self.userId,
            name: self.name,
            endTime: self.endTime.toDate(format: .time)
        )
    }
}
