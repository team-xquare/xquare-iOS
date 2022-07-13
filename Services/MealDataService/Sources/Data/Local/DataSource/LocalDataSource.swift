import Foundation

protocol LocalDataSource {
    func registerDayToMealMenu(day: Date, breakfast: [String], lunch: [String], dinner: [String])
    func fetchDayToMealMenu(day: Date) -> DayToMealMenuEntity
    func fetchMonthToMealMenu(day: Date) -> [MonthToMealMenuEntity]
}
