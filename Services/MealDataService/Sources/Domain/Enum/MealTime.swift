import Foundation

public enum MealTime: String {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

public extension MealTime {
    func toString() -> String {
        switch self {
        case .breakfast:
            return "아침"
        case .lunch:
            return "점심"
        case .dinner:
            return "저녁"
        }
    }

    func checkIsNow() -> Bool {
        let nowTime = Date()
        var nowMeal: MealTime = .breakfast
        if Int(nowTime.toString(format: "HH")) ?? 0 >= 13 && Int(nowTime.toString(format: "mm")) ?? 0 >= 30 {
            nowMeal = .dinner
        } else if Int(nowTime.toString(format: "HH")) ?? 0 >= 9 && Int(nowTime.toString(format: "mm")) ?? 0 >= 40 {
            nowMeal = .lunch
        } else {
            nowMeal = .breakfast
        }
        return nowMeal == self
    }
}
