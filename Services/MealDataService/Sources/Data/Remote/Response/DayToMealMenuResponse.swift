import Foundation

struct MealMenuPerDayResponse: Decodable {

    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]

}

extension MealMenuPerDayResponse {
    func toDomain() -> MealMenuPerDayEntity {
        let date = Date()
        return .init(
            mealMenu: [
                .init(date: date.toString(format: .fullDate), menu: breakfast, time: .breakfast),
                .init(date: date.toString(format: .fullDate), menu: lunch, time: .lunch),
                .init(date: date.toString(format: .fullDate), menu: dinner, time: .dinner)
            ]
        )
    }
}
