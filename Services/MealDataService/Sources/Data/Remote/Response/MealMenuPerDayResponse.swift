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
                .init(mealTime: .breakfast, menu: breakfast ?? ["급식이 없습니다.1"]),
                .init(mealTime: .lunch, menu: lunch ?? ["급식이 없습니다.2"]),
                .init(mealTime: .dinner, menu: dinner ?? ["급식이 없습니다.3"])
            ]
        )
    }
}
