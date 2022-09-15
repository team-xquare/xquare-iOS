import Foundation

public extension Date {

    func toString(format: DateFormat) -> String {
        return self.toString(format: format.rawValue)
    }

    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

}
