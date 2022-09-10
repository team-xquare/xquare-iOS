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
                .init(mealTime: .breakfast, menu: breakfast ?? ["등록된 급식 정보가 없어요."]),
                .init(mealTime: .lunch, menu: lunch ?? ["등록된 급식 정보가 없어요."]),
                .init(mealTime: .dinner, menu: dinner ?? ["등록된 급식 정보가 없어요."])
            ]
        )
    }
}
