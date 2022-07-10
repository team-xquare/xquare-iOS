import Foundation

struct MonthToMealMenuListResponse: Decodable {

    let meals: [MonthToMealMenuResponse]
}

extension MonthToMealMenuListResponse {
    func toDomain() -> [MonthToMealMenuEntity] {
        return meals.map { $0.toDomain() }
    }
}
