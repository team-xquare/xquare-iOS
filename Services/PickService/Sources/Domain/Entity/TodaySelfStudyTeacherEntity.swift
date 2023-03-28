import Foundation

public struct TodaySelfStudyTeacherEntity: Equatable {
    public let secondFloor: String
    public let thirdFloor: String
    public let fourthFloor: String

    public init(secondFloor: String, thirdFloor: String, fourthFloor: String) {
        self.secondFloor = secondFloor
        self.thirdFloor = thirdFloor
        self.fourthFloor = fourthFloor
    }
}
