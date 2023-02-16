import Foundation

struct WeekTimeTableResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case weekDay = "week_day"
        case dayTimeTable = "day_timetable"
    }
    let weekDay: String
    let dayTimeTable: [DayTimeTableResponse]
}

extension WeekTimeTableResponse {
    func toDomain() -> WeekTimeTableEntity {
        return .init(
            weekDay: weekDay.toDate(format: .fullDate),
            dayTimeTable: dayTimeTable.map { $0.toDomain() }
        )
    }
}
