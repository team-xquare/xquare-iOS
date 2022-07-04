import Foundation

struct MonthToMealMenuListResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case meals
    }

    let meals: [MonthToMealMenuResponse]
}

extension MonthToMealMenuListResponse {
    func toDomain() -> [MonthToMoealMenuEntity] {
        return meals.map { $0.toDomain() }
    }
}
