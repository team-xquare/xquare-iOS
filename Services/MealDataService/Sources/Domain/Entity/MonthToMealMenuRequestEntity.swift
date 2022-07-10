import Foundation

public struct MonthToMealMenuRequestEntity {
    let year: Date
    let month: Date
}

extension MonthToMealMenuRequestEntity {
    func toMonthToMealMenuRequest() -> MonthToMealMenuRequest {
        return .init(
            year: self.year.toYearString(),
            month: self.month.toMonthString()
        )
    }
}
