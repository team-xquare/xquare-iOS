import Foundation

import RxSwift

class LocalDataSourceImpl: LocalDataSource {

    let mealDataSQLiteTask = MealDataServiceSQLiteTask.shared

    func registerMealMenuPerDay(menu: MealMenu) {
        Task {
            try await mealDataSQLiteTask.save(entity: menu)
        }
    }

    func registerMealMenuPerMonth(menu: [MealMenu]) {
        for item in menu {
            Task {
                try await self.mealDataSQLiteTask.save(entity: item)
            }
        }
    }

    func fetchMealMenuPerDay(day: Date) -> Single<MealMenu> {
        return Single.create { single -> Disposable in
            Task {
                let menu = await self.mealDataSQLiteTask.findMealByDay(day: day)
                single(.success(menu))
            }
            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenu]> {
        return Single.create { single -> Disposable in
            Task {
                let menuList = await self.mealDataSQLiteTask.findMealByMonth(day: day)
                single(.success(menuList))
            }

            return Disposables.create()
        }
    }
}
