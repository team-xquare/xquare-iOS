import Foundation

struct MealMenuPerMonthResponse: Decodable {

    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}

extension MealMenuPerMonthResponse {
    func toDomain() -> [MealMenuEntity] {
        return [
            MealMenuEntity(date: date, menu: breakfast, time: .breakfast),
            MealMenuEntity(date: date, menu: lunch, time: .lunch),
            MealMenuEntity(date: date, menu: dinner, time: .dinner)
        ]
    }
}
