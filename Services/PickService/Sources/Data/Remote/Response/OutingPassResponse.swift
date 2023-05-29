import Foundation

import XDateUtil

struct OutingPassResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case profileFileName = "profile_file_name"
        case studentNumber = "student_number"
        case studentName = "student_name"
        case startTime = "start_time"
        case endTime = "end_time"
        case reason
        case teacherName = "teacher_name"
        case picnicDate = "picnic_date"

    }

    let profileFileName: String?
    let studentNumber: String
    let studentName: String
    let startTime: String
    let endTime: String
    let reason: String
    let teacherName: String
    let picnicDate: String

}

extension OutingPassResponse {
    func toDomain() -> OutingPassEntity {
        return .init(
            profileFileName: self.profileFileName,
            studentNumber: self.studentNumber,
            studentName: self.studentName,
            startTime: self.startTime.toDate(format: .time),
            endTime: self.endTime.toDate(format: .time),
            reason: self.reason,
            teacherName: self.teacherName,
            picnicDate: self.picnicDate.toDate(format: .fullDate)
        )
    }
}
