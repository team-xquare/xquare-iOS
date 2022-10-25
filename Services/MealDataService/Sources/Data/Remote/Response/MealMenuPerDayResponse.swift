import Foundation

struct MealMenuPerDayResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case breakfast
        case lunch
        case dinner
        case breakfastKcal = "breakfast_kcal"
        case lunchKcal = "lunch_kcal"
        case dinnerKcal = "dinner_kcal"
    }
    var breakfast: [String]?
    var lunch: [String]?
    var dinner: [String]?
    var breakfastKcal: String?
    var lunchKcal: String?
    var dinnerKcal: String?
}

extension MealMenuPerDayResponse {
    func toDomain() -> MealMenuPerDayEntity {
        let date = Date()
        return .init(
            date: date,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast, kcal: breakfastKcal),
                .init(mealTime: .lunch, menu: lunch, kcal: lunchKcal),
                .init(mealTime: .dinner, menu: dinner, kcal: dinnerKcal)
            ]
        )
    }
}
