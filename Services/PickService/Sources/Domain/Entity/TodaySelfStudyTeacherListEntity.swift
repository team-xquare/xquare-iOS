import Foundation

public struct TodaySelfStudyTeacherListEntity: Equatable {
    public let selfStudyList: [TodaySelfStudyTeacherEntity]

    public init(selfStudyList: [TodaySelfStudyTeacherEntity]) {
        self.selfStudyList = selfStudyList
    }
}
