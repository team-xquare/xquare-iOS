import Foundation

struct MealMenuPerDayResponse: Decodable {
    let breakfast: [String]?
    let lunch: [String]?
    let dinner: [String]?
}

extension MealMenuPerDayResponse {
    func toDomain() -> MealMenuPerDayEntity {
        let date = Date()
        return .init(
            date: date,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast, kcal: ""),
                .init(mealTime: .lunch, menu: lunch, kcal: ""),
                .init(mealTime: .dinner, menu: dinner, kcal: "")
            ]
        )
    }
}
