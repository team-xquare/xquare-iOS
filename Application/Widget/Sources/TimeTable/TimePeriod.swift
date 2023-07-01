import Foundation
import XDateUtil
enum TimePeriod: Int {
    case morning = 0
    case period1 = 1
    case period2 = 2
    case period3 = 3
    case period4 = 4
    case period5 = 5
    case period6 = 6
    case period7 = 7
    case night = 8
    init(date: Date) {
        let time = date.toString(format: .time)
        switch time {
        case "00:00:00"..<"08:40:00":
            self = .morning
        case "08:40:00"..<"09:40:00":
            self = .period1
        case "09:40:00"..<"10:40:00":
            self = .period2
        case "10:40:00"..<"11:40:00":
            self = .period3
        case "11:40:00"..<"13:30:00":
            self = .period4
        case "13:30:00"..<"14:30:00":
            self = .period5
        case "14:30:00"..<"15:30:00":
            self = .period6
        case "15:30:00"..<"16:30:00":
            self = .period7
        default:
            self = .night
        }
    }
}
