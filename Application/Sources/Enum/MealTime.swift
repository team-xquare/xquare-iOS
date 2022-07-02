import Foundation

enum MealTime: Int {
    case morning = 0
    case launch = 1
    case dinner = 2
}

extension MealTime {
    func toString() -> String {
        switch self {
        case .morning:
            return "아침"
        case .launch:
            return "점심"
        case .dinner:
            return "저녁"
        }
    }
}
