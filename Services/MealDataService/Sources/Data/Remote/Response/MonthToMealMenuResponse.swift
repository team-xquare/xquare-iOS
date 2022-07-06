import Foundation

struct MonthToMealMenuResponse: Decodable {

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
