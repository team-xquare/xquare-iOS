import Foundation

public struct MonthToMealMenuRequestEntity {
    let day: Date
}

extension MonthToMealMenuRequestEntity {
    func toMonthToMealMenuRequest() -> MonthToMealMenuRequest {
        return .init(
            year: self.day.toString(format: .year),
            month: self.day.toString(format: .mounth)
        )
    }
}
