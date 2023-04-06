import Foundation

import XDateUtil

struct TodaySelfStudyTeacherResponse: Decodable {
    let type, date: String
    let teacher: [String]
}

extension TodaySelfStudyTeacherResponse {
    func toDomain() -> TodaySelfStudyTeacherEntity {
        return .init(
            type: self.type,
            date: date.toDate(format: .fullDate).toString(format: "M월 d일 (E)"),
            teacher: self.teacher
        )
    }
}
