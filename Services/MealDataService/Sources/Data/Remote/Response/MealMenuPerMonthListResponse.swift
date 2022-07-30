import Foundation

struct MealMenuListPerMonthResponse: Decodable {

    let meals: [MealMenuPerMonthResponse]
}

extension MealMenuListPerMonthResponse {
    func toDomain() -> [MealMenuPerDayEntity] {
        return meals.map { $0.toDomain() }
    }
}
