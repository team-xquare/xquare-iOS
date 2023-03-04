import Foundation

public struct MealMenuPerDayEntity: Equatable {
    public let date: String
    public let menu: [MealMenuEntity]

    public init(date: String, menu: [MealMenuEntity]) {
        self.date = date
        self.menu = menu
    }
}
