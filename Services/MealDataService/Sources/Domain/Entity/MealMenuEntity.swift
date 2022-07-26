import Foundation

public struct MealMenuEntity: Equatable {
    public let date: String
    public let menu: [String]
    public let time: MealTime
}
