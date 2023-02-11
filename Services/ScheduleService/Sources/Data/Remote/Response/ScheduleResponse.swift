import Foundation

import XDateUtil

struct ScheduleResponse: Decodable {
    let name: String
    let date: String
}

extension ScheduleResponse {
    func toDomain() -> ScheduleEntity {
        return .init(
            name: name,
            date: date.toDate(format: .fullDate)
        )
    }
}
