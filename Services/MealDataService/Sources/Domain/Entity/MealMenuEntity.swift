import Foundation

public struct MealMenuEntity: Equatable {
    public let mealTime: MealTime
    public let menu: [String]?
    public let kcal: String?

    public init(mealTime: MealTime, menu: [String]?, kcal: String?) {
        self.mealTime = mealTime
        self.menu = menu
        self.kcal = kcal
    }
}
