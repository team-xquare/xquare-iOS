import Foundation

public struct MonthToMealMenuEntity: Equatable {
    public let date: String
    public let breakfast: [String]
    public let lunch: [String]
    public let dinner: [String]
}
