import Foundation

struct MonthToMealMenuResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case date
        case breakfast
        case lunch
        case dinner
    }

    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}

extension MonthToMealMenuResponse {
    func toDomain() -> MonthToMealMenuEntity {
        return .init(
            date: date,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }
}
