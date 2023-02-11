import Foundation

struct WeekTimeTableListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case weekTimeTable = "week_timetable"
    }
    let weekTimeTable: [WeekTimeTableResponse]
}

extension WeekTimeTableListResponse {
    func toDomain() -> [WeekTimeTableEntity] {
        return weekTimeTable.map { $0.toDomain() }
    }
}
