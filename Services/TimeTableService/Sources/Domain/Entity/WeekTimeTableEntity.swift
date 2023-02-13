import Foundation

public struct WeekTimeTableEntity: Equatable {
    public let weekDay: Int
    public let dayTimeTable: [DayTimeTableEntity]
}
