import Foundation

public struct WeekTimeTableEntity: Equatable {
    public let weekDay: Int
    public let date: Date
    public let dayTimeTable: [DayTimeTableEntity]
}
