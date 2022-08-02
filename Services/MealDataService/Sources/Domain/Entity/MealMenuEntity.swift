import Foundation

public struct MealMenuEntity: Equatable {
    public let mealTime: MealTime
    public let menu: [String]

    public init(mealTime: MealTime, menu: [String]) {
        self.mealTime = mealTime
        self.menu = menu
    }
}
