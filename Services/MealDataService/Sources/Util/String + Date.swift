import Foundation

extension String {
    func toDate() -> Date {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
        return dateFormmater.date(from: self)!
    }
}
