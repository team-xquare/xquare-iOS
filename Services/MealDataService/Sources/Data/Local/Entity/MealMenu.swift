import Foundation

import XDateUtil

struct MealMenu: Codable, Equatable {
    let day: String
    let breakfast: String
    let lunch: String
    let dinner: String
    let breakfastKcal: String
    let lunchKcal: String
    let dinnerKcal: String
}

extension MealMenu {
    func toDomain() -> MealMenuPerDayEntity {
        return .init(
            date: day.toDate(format: .fullDate).toString(format: "M월 d일 (E)"),
            menu: [
                .init(mealTime: .breakfast, menu: breakfast.components(separatedBy: ", "), kcal: breakfastKcal),
                .init(mealTime: .lunch, menu: lunch.components(separatedBy: ", "), kcal: lunchKcal),
                .init(mealTime: .dinner, menu: dinner.components(separatedBy: ", "), kcal: dinnerKcal)
            ]
        )
    }
}
