import Foundation

public struct WeekTimeTableEntity: Equatable {
    public let weekDay: Date
    public let dayTimeTable: [DayTimeTableEntity]
}
