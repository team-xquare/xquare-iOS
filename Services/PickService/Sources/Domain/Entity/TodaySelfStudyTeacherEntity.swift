import Foundation

public struct TodaySelfStudyTeacherEntity: Equatable {
    public let type, date: String
    public let teacher: [String]

    public init(type: String, date: String, teacher: [String]) {
        self.type = type
        self.date = date
        self.teacher = teacher
    }
}
