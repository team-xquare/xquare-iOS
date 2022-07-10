import Foundation

struct DayToMealMenuResponse: Decodable {

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
