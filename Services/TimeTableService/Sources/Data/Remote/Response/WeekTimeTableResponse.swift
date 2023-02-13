import Foundation

struct WeekTimeTableResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case weekDay = "week_day"
        case dayTimeTable = "day_timetable"
    }
    let weekDay: Int
    let dayTimeTable: [DayTimeTableResponse]
}

extension WeekTimeTableResponse {
    func toDomain() -> WeekTimeTableEntity {
        return .init(
            weekDay: weekDay,
            dayTimeTable: dayTimeTable.map { $0.toDomain() }
        )
    }
}
