import Foundation

import XDateUtil

struct WeekTimeTableResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case weekDay = "week_day"
        case date
        case dayTimeTable = "day_timetable"
    }
    let weekDay: Int
    let date: String
    let dayTimeTable: [DayTimeTableResponse]
}

extension WeekTimeTableResponse {
    func toDomain() -> WeekTimeTableEntity {
        return .init(
            weekDay: weekDay,
            date: date.toDate(format: .fullDate),
            dayTimeTable: dayTimeTable.map { $0.toDomain() }
        )
    }
}
