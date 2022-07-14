import Foundation

protocol LocalDataSource {
    func registerDayToMealMenu(day: Date, breakfast: [String], lunch: [String], dinner: [String])
    func fetchMealMenuPerDay(day: Date) -> DayToMealMenuEntity
    func fetchMealMenuPerMonth(day: Date) -> [MonthToMealMenuEntity]
}
