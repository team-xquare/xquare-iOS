import Foundation

struct MealMenuPerMonthResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case date
        case breakfast
        case lunch
        case dinner
        case breakfastKcal = "breakfast_kcal"
        case lunchKcal = "lunch_kcal"
        case dinnerKcal = "dinner_kcal"
    }
    let date: String
    let breakfast: [String]?
    let lunch: [String]?
    let dinner: [String]?
    let breakfastKcal: String?
    let lunchKcal: String?
    let dinnerKcal: String?
}

extension MealMenuPerMonthResponse {
    func toDomain() -> MealMenuPerDayEntity {
        return .init(
            date: date.toDate(format: .fullDate),
            menu: [
                .init(mealTime: .breakfast, menu: breakfast, kcal: breakfastKcal),
                .init(mealTime: .lunch, menu: lunch, kcal: lunchKcal),
                .init(mealTime: .dinner, menu: dinner, kcal: dinnerKcal)
            ]
        )
    }
}
