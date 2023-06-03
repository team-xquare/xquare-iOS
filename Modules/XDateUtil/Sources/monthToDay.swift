import Foundation

extension Int {
    func monthToDate(date: Date) -> Int {
        switch self {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        default:
            if Calendar.current.dateComponents([.year], from: date).isLeapMonth! {
                return 29
            } else {
                return 28
            }
        }
    }
}
