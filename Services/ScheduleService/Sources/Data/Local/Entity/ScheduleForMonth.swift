import Foundation

import XDateUtil

struct ScheduleForMonth: Codable, Equatable {
    let id: String
    let name: String
    let date: String
}

extension ScheduleForMonth {
    func toDomain() -> ScheduleEntity {
        return .init(
            id: id,
            name: name,
            date: date.toDate(format: .fullDate)
        )
    }
}
