import Foundation

public struct MealMenuPerDayEntity: Equatable {
    public let date: Date
    public let menu: [MealMenuEntity]

    public init(date: Date, menu: [MealMenuEntity]) {
        self.date = date
        self.menu = menu
    }
}
