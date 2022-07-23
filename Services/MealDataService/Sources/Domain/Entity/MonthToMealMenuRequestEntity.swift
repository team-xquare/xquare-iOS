import Foundation

public struct MonthToMealMenuRequestEntity {
    public let day: Date

    public init(day: Date) {
        self.day = day
    }
}

extension MonthToMealMenuRequestEntity {
    func toMonthToMealMenuRequest() -> MonthToMealMenuRequest {
        return .init(
            year: self.day.toString(format: .year),
            month: self.day.toString(format: .mounth)
        )
    }
}
