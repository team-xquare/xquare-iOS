import Foundation

public extension String {
    func toDate(format: DateFormat) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: self)!
    }
}
