import Foundation

struct OutingPassResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case profileFileName = "profile_file_name"
        case studentNumber = "student_number"
        case studentName = "student_name"
        case startTime = "start_time"
        case endTime = "end_time"
        case reason
        case teacherName = "teacher_name"
    }

    let profileFileName: String
    let studentNumber: String
    let studentName: String
    let startTime: String
    let endTime: String
    let reason: String
    let teacherName: String

}

extension OutingPassResponse {
    func toDomain() -> OutingPassEntity {
        return .init(
            profileFileName: self.profileFileName,
            studentNumber: self.studentNumber,
            studentName: self.studentNumber,
            startTime: self.startTime.toDate(format: .time),
            endTime: self.endTime.toDate(format: .time),
            reason: self.reason,
            teacherName: self.teacherName
        )
    }
}
