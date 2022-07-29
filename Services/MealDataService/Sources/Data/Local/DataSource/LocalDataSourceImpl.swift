import Foundation

import RxSwift

class LocalDataSourceImpl: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    func registerMealMenuPerDay(menu: MealMenuEntity) {
        mealDataSQLiteTask.save(entity: menu)
    }

    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuEntity> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByDay(day: day)))

            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenuEntity]> {
        return Single.create { single -> Disposable in
            single(.success(self.mealDataSQLiteTask.findMealByMonth(day: day)))

            return Disposables.create()
        }
    }

    func registerMealMenuPerMonth(menu: [MealMenuEntity]) {
        menu.forEach {
            mealDataSQLiteTask.save(
                entity: $0
            )
        }
    }
}
