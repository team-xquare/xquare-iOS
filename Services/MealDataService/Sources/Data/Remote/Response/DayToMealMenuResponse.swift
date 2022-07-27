import Foundation

struct MealMenuPerDayResponse: Decodable {
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}

extension MealMenuPerDayResponse {
    func toDomain() -> MealMenuEntity {
        let date = Date()
        return .init(
            date: date,
            menu: [
                .breakfast: breakfast,
                .lunch: lunch,
                .dinner: dinner
            ]
        )
    }
}
