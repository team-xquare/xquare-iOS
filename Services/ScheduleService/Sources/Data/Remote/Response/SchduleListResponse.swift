import Foundation

struct ScheduleListResponse: Decodable {
    let schedules: [ScheduleResponse]
}

extension ScheduleListResponse {
    func toDomain() -> [ScheduleEntity] {
        return schedules.map { $0.toDomain() }
    }
}
