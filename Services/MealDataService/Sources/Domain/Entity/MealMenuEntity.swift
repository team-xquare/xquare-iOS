import Foundation

public struct MealMenuEntity: Equatable {
    public let date: Date
    public let menu: [MealTime: [String]]
}
