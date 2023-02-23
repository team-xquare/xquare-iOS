import Foundation

public struct DayTimeTableEntity: Equatable {
    public let period: Int
    public let beginTime: Date
    public let endTime: Date
    public let subjectName: String
    public let subjectImageUrl: URL?
}
