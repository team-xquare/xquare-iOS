import Foundation

struct MealMenuPerDayResponse: Decodable {
    var breakfast: [String]?
    var lunch: [String]?
    var dinner: [String]?
}

extension MealMenuPerDayResponse {
    func toDomain() -> MealMenuPerDayEntity {
        let date = Date()
        return .init(
            date: date,
            menu: [
                .init(mealTime: .breakfast, menu: breakfast?.dropLast(), kcal: dinner?.last),
                .init(mealTime: .lunch, menu: lunch?.dropLast(), kcal: dinner?.last),
                .init(mealTime: .dinner, menu: dinner?.dropLast(), kcal: dinner?.last)
            ]
        )
    }
}
