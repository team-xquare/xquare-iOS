import Foundation

public struct OutingPassEntity: Equatable {
    public let profileFileName: String
    public let studentNumber: String
    public let studentName: String
    public let startTime: Date
    public let endTime: Date
    public let reason: String
    public let teacherName: String

    public init(
        profileFileName: String,
        studentNumber: String,
        studentName: String,
        startTime: Date,
        endTime: Date,
        reason: String,
        teacherName: String
    ) {
        self.profileFileName = profileFileName
        self.studentNumber = studentNumber
        self.studentName = studentName
        self.startTime = startTime
        self.endTime = endTime
        self.reason = reason
        self.teacherName = teacherName
    }
}
