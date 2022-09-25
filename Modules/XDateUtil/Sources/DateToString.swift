import Foundation

public extension Date {

    func toString(format: DateFormat) -> String {
        return self.toString(format: format.rawValue)
    }

    func toString(format: String) -> String {
        XDateFormatter.shared.dateFormat = format
        return XDateFormatter.shared.string(from: self)
    }

}
