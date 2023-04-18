import Foundation

import XDateUtil

struct DayTimeTableResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case period
        case beginTime = "begin_time"
        case endTime = "end_time"
        case subjectName = "subject_name"
        case subjectImageUrlString = "subject_image"
    }
    let period: Int
    let beginTime: String
    let endTime: String
    let subjectName: String
    let subjectImageUrlString: String
}

extension DayTimeTableResponse {
    func toDomain() -> DayTimeTableEntity {
        return .init(
            period: period,
            beginTime: beginTime.toDate(format: .time),
            endTime: endTime.toDate(format: .time),
            subjectName: subjectName,
            subjectImageUrl: URL(string: subjectImageUrlString)
        )
    }
}
