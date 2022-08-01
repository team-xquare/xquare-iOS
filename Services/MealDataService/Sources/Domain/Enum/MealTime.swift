import Foundation

public enum MealTime: String {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

public extension MealTime {
    var mealTimeOrder: Int {
        switch self {
        case .breakfast:
            return 0
        case .lunch:
            return 1
        case .dinner:
            return 2
        }
    }
}
