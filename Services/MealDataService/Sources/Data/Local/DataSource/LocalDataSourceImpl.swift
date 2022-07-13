import Foundation

class LocalDataSourceImplt: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    func registerDayToMealMenu(day: Date, breakfast: [String], lunch: [String], dinner: [String]) {
        mealDataSQLiteTask.insertData(
            date: day,
            breakfast: breakfast.joined(separator: " "),
            lunch: lunch.joined(separator: " "),
            dinner: dinner.joined(separator: " ")
        )
    }

    func fetchDayToMealMenu(day: Date) -> DayToMealMenuEntity {
        return mealDataSQLiteTask.readData(day: day)
    }

    func fetchMonthToMealMenu(day: Date) -> [MonthToMealMenuEntity] {
        return mealDataSQLiteTask.readMonthToMealMenu(day: day)
    }
}
