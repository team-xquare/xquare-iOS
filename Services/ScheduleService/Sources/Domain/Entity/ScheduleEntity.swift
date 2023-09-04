import Foundation
import XDateUtil
public struct ScheduleEntity: Equatable {
    public let id: String
    public let name: String
    public let date: Date
}

extension ScheduleEntity {
    func toDomain() -> ScheduleForMonth {
        return .init(
            id: id,
            name: name,
            date: date.toString(format: .fullDate)
        )
    }
}
