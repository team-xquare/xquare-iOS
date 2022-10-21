import Foundation

struct MealMenu: Equatable {
    let day: Date
    let breakfast: String
    let lunch: String
    let dinner: String
}

extension MealMenu {
    func toDomain() -> MealMenuPerDayEntity {
        return .init(
            date: day,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast.components(separatedBy: ", "), kcal: ""),
                .init(mealTime: .lunch, menu: lunch.components(separatedBy: ", "), kcal: ""),
                .init(mealTime: .dinner, menu: dinner.components(separatedBy: ", "), kcal: "")
            ]
        )
    }
}
