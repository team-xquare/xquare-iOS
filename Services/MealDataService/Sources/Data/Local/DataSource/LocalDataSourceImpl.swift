import Foundation

import RxSwift

class LocalDataSourceImpl: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    func registerMealMenuPerDay(day: Date, breakfast: [String], lunch: [String], dinner: [String]) {
        mealDataSQLiteTask.save(entity: .init(
            mealMenu: [
                .init(date: day.toString(format: .fullDate), menu: breakfast, time: .breakfast),
                .init(date: day.toString(format: .fullDate), menu: lunch, time: .lunch),
                .init(date: day.toString(format: .fullDate), menu: dinner, time: .dinner)
            ]
        ))
    }

    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuPerDayEntity> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByDay(day: day)))

            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[[MealMenuEntity]]> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByMonth(day: day)))

            return Disposables.create()
        }
    }

    func registerMealMenuPerMonth(menu: [[MealMenuEntity]]) {
        menu.forEach {
            mealDataSQLiteTask.save(
                entity: .init(mealMenu: $0)
            )
        }
    }
}
