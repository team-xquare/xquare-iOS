import Foundation

struct DayToMealMenuResponse: Decodable {

    private enum Codingkeys: String, CodingKey {
        case breakfast
        case lunch
        case dinner
    }

    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]

}

extension DayToMealMenuResponse {
    func toDomain() -> DayToMealMenuEntity {
        return .init(
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }
}
