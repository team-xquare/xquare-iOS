import Foundation

public struct MealMenuPerDayEntity: Equatable {
    public let date: Date
    public let menu: [MealMenuEntity]
}
