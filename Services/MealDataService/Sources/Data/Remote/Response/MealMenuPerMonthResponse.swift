import Foundation

struct MealMenuPerMonthResponse: Decodable {
    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}

extension MealMenuPerMonthResponse {
    func toDomain() -> MealMenuPerDayEntity {
        return .init(
            date: date.toDate(format: .fullDate),
            menu: [
                .init(mealTime: .breakfast, menu: breakfast),
                .init(mealTime: .lunch, menu: lunch),
                .init(mealTime: .dinner, menu: dinner)
            ]
        )
    }
}
