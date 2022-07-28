import Foundation

struct MealMenuPerMonthResponse: Decodable {
    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}

extension MealMenuPerMonthResponse {
    func toDomain() -> MealMenuEntity {
        return .init(
            date: date.toDate(format: .fullDate),
            menu: [
                .breakfast: breakfast,
                .lunch: lunch,
                .dinner: dinner
            ]
        )
    }
}
