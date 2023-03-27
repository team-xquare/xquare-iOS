import Foundation

public extension String {
    func toDate(format: DateFormat) -> Date {
        XDateFormatter.shared.dateFormat = format.rawValue
        XDateFormatter.shared.timeZone = TimeZone(identifier: "KST")
        return XDateFormatter.shared.date(from: self)!
    }
}
