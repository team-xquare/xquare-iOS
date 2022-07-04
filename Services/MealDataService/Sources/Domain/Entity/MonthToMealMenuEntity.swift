import Foundation

public struct MonthToMealMenuEntity: Equatable {
    let date: String
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
}
