import Foundation

struct DayTimeTableResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case period
        case beginTime = "begin_time"
        case endTime = "end_time"
        case subjectName = "subject_name"
        case subjectImageUrlString = "subject_image"
        case date
    }
    let period: Int
    let beginTime: String
    let endTime: String
    let subjectName: String
    let subjectImageUrlString: String
    let date: String
}

extension DayTimeTableResponse {
    func toDomain() -> DayTimeTableEntity {
        return .init(
            period: period,
            beginTime: beginTime.toDate(format: .fullDateWithTime),
            endTime: endTime.toDate(format: .fullDate),
            subjectName: subjectName,
            subjectImageUrl: URL(string: subjectImageUrlString),
            date: date.toDate(format: .fullDate)
        )
    }
}
