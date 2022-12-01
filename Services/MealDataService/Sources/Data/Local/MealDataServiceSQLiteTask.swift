import Foundation

import XDateUtil
import SQLite3
import Boutique

class MealDataServiceSQLiteTask {

    static let shared = MealDataServiceSQLiteTask()

    let store = Store<MealMenu>(
        storage: SQLiteStorageEngine(directory: .defaultStorageDirectory(appendingPath: "MealMenu"))!,
        cacheIdentifier: \.day
    )

    func save(entity: MealMenu) async throws {
        let mealMenu = MealMenu(
            day: entity.day,
            breakfast: entity.breakfast,
            lunch: entity.lunch,
            dinner: entity.dinner,
            breakfastKcal: entity.breakfastKcal,
            lunchKcal: entity.lunchKcal,
            dinnerKcal: entity.dinner
        )

        try await store
            .insert(mealMenu)
            .run()
    }

    func findMealByDay(day: Date) async -> MealMenu {
        var result = await store
            .items
            .filter {
                $0.day == day.toString(format: .fullDate)
            }
        return result.first ?? .init(
            day: Date().toString(format: .fullDate),
            breakfast: "",
            lunch: "",
            dinner: "",
            breakfastKcal: "",
            lunchKcal: "",
            dinnerKcal: ""
        )
    }

    @MainActor
    func findMealByMonth(day: Date) async -> [MealMenu] {
        let results = store
            .items
            .filter {
                $0.day.contains("\(day.toString(format: .year))-\(day.toString(format: .month))")
            }
        return results
    }
}
