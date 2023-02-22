import Foundation

import XDateUtil

struct ScheduleResponse: Decodable {
    let id: String
    let name: String
    let date: String
}

extension ScheduleResponse {
    func toDomain() -> ScheduleEntity {
        return .init(
            id: id,
            name: name,
            date: date.toDate(format: .fullDate)
        )
    }
}
