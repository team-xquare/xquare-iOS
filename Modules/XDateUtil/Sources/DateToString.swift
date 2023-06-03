import Foundation

public extension Date {

    func toString(format: DateFormat) -> String {
        return self.toString(format: format.rawValue)
    }

    func toString(format: String) -> String {
        XDateFormatter.shared.dateFormat = format
        return XDateFormatter.shared.string(from: self)
    }

    func getTimeAgoAsKoreanString() -> String {
        var resultMinute = Calendar.current.dateComponents([.minute], from: self, to: .now).minute!
        if resultMinute / 60 == 0 && resultMinute % 60 == 0 {
            return "방금 전"
        } else if resultMinute / 60 == 0 {
            return "\(resultMinute % 60)분 전"
        } else if resultMinute / 60 / 24 == 0 {
            return "\(resultMinute / 60 % 24)시간 전"
        } else {
            resultMinute = resultMinute / 60 / 24
            let toDay = Calendar.current.dateComponents([.year, .month, .day], from: .now)
            let sendAt = Calendar.current.dateComponents([.year, .month, .day], from: self)
            if (toDay.day! - sendAt.day! < 0 && toDay.month! == sendAt.month! + 1) || sendAt.month == toDay.month {
                return "\(resultMinute)일 전"
            } else {
                let yearDifference = (toDay.year! - sendAt.year!) * 12
                for time in sendAt.month!..<toDay.month! + yearDifference {
                    if time % 12 == 0 {
                        resultMinute -= 12.monthToDate(date: self)
                    } else {
                        resultMinute -= time%12.monthToDate(date: self)
                    }
                }
                if resultMinute >= 1 {
                    if toDay.month! + yearDifference - sendAt.month! >= 12 {
                        return "\((toDay.month! + yearDifference - sendAt.month!) / 12)년 전"
                    } else {
                        return "\(toDay.month! + yearDifference - sendAt.month!)달 전"
                    }
                } else {
                    return "\(toDay.month! + yearDifference - sendAt.month! - 1)달 전"
                }
            }
        }
    }
}
