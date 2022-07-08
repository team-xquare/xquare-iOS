import Foundation

public struct MonthToMealMenuRequestEntity {
    let year: String
    let month: String
}

extension MonthToMealMenuRequestEntity {
    func toMonthToMealMenuRequest() -> MonthToMealMenuRequest {
        return .init(
            year: self.year,
            month: self.month
        )
    }
}
