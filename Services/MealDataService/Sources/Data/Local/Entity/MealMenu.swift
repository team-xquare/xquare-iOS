import Foundation

struct MealMenu: Equatable {
    let day: Date
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
            date: day,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast.components(separatedBy: ", "), kcal: breakfastKcal),
                .init(mealTime: .lunch, menu: lunch.components(separatedBy: ", "), kcal: lunchKcal),
                .init(mealTime: .dinner, menu: dinner.components(separatedBy: ", "), kcal: dinnerKcal)
            ]
        )
    }
}
