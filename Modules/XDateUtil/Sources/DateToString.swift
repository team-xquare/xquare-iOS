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
        let today = Date()
        let resultMinute = calculateToMinute(date: today) - calculateToMinute(date: self)
        print("\(resultMinute) : \(today) - \(self)")
        if resultMinute / 60 == 0 && resultMinute % 60 == 0 {
            return "방금 전"
        } else if resultMinute / 60 == 0 {
            return "\(resultMinute % 60)분 전"
        } else if resultMinute / 60 / 24 == 0 {
            return "\(resultMinute / 60 % 24)시간 전"
        } else if resultMinute / 60 / 24 / 30 == 0 {
            return "\(resultMinute / 60 / 24 % 30)일 전"
        } else {
            return "\(resultMinute / 60 / 24 / 30)달 전"
        }
    }
    private func calculateToMinute(date: Date) -> Int {
        let dateList = date.toString(format: "MM:dd:HH:mm").split(separator: ":").map { Int($0)! }
        return dateList[0] * 30 * 24 * 60 * 1 + dateList[1] * 24 * 60 * 1 + dateList[2] * 60 * 1 + dateList[3]
    }
}
