import Foundation

public struct OutingPassEntity: Equatable {
    private let profileFileName: String
    private let studentNumber: String
    private let studentName: String
    private let startTime: Date
    private let endTime: Date
    private let reason: String
    private let teacherName: String

    public init(profileFileName: String, studentNumber: String, studentName: String, startTime: Date,
                endTime: Date, reason: String, teacherName: String) {
        self.profileFileName = profileFileName
        self.studentNumber = studentNumber
        self.studentName = studentName
        self.startTime = startTime
        self.endTime = endTime
        self.reason = reason
        self.teacherName = teacherName
    }
}
