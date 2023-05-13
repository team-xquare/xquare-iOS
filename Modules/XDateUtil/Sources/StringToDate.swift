import Foundation

public extension String {
    func toDate(format: DateFormat) -> Date {
        XDateFormatter.shared.dateFormat = format.rawValue
        guard let returnDate = XDateFormatter.shared.date(from: self) else {
            print("toDate Error: Date로 format하려는 데이터의 형식이 DateFormat과 일치하지 않습니다.")
            return Date()
        }
        return returnDate
    }
}
