import Foundation

public extension String {
    func toDate(format: DateFormat) -> Date {
        XDateFormatter.shared.dateFormat = format.rawValue
        guard let returnDate = XDateFormatter.shared.date(from: self) else {
            return Date()
        }
        return returnDate
    }
}
