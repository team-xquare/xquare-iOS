import Foundation

import RxSwift

class LocalDataSourceImpl: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    func registerDayToMealMenu(day: Date, breakfast: [String], lunch: [String], dinner: [String]) {
        mealDataSQLiteTask.save(mealMenu: MealMenu(
            day: day,
            breakfast: breakfast.joined(separator: " "),
            lunch: lunch.joined(separator: " "),
            dinner: dinner.joined(separator: " ")
        ))
    }

    func fetchMealMenuPerDay(day: Date) -> Single<DayToMealMenuEntity> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByDay(day: day)))

            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[MonthToMealMenuEntity]> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByMonth(day: day)))

            return Disposables.create()
        }
    }
}
