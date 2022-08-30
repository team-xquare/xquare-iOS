import Foundation

import RxSwift

class LocalDataSourceImpl: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    init() {
        mealDataSQLiteTask.createTable()
    }

    func registerMealMenuPerDay(menu: MealMenuPerDayEntity) {
        mealDataSQLiteTask.save(entity: menu)
    }

    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuPerDayEntity> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByDay(day: day)))

            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenuPerDayEntity]> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByMonth(day: day)))

            return Disposables.create()
        }
    }

    func registerMealMenuPerMonth(menu: [MealMenuPerDayEntity]) {
        menu.forEach {
            mealDataSQLiteTask.save(
                entity: $0
            )
        }
    }
}
