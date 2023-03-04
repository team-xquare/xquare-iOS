import Foundation

import RxSwift
import XDateUtil
import Boutique

class LocalDataSourceImpl: LocalDataSource {

    let store = Store<MealMenu>(
        storage: SQLiteStorageEngine(directory: .defaultStorageDirectory(appendingPath: "MealMenu"))!,
        cacheIdentifier: \.day
    )

    func registerMealMenuPerDay(menu: MealMenu) {
        Task {
            let mealMenu = MealMenu(
                day: menu.day,
                breakfast: menu.breakfast,
                lunch: menu.lunch,
                dinner: menu.dinner,
                breakfastKcal: menu.breakfastKcal,
                lunchKcal: menu.lunchKcal,
                dinnerKcal: menu.dinner
            )

            try await store
                .insert(mealMenu)
                .run()
        }
    }

    func registerMealMenuPerMonth(menu: [MealMenu]) {
        for item in menu {
            Task {
                let mealMenu = MealMenu(
                    day: item.day,
                    breakfast: item.breakfast,
                    lunch: item.lunch,
                    dinner: item.dinner,
                    breakfastKcal: item.breakfastKcal,
                    lunchKcal: item.lunchKcal,
                    dinnerKcal: item.dinnerKcal
                )

                try await store
                    .insert(mealMenu)
                    .run()
            }
        }
    }

    func fetchMealMenuPerDay(day: Date) -> Single<MealMenu> {
        return Single.create { single -> Disposable in
            Task {
                let result = await self.store
                    .items
                    .filter {
                        $0.day == day.toString(format: .fullDate)
                    }
                let menu = result.first ?? .init(
                    day: Date().toString(format: .fullDate),
                    breakfast: "",
                    lunch: "",
                    dinner: "",
                    breakfastKcal: "",
                    lunchKcal: "",
                    dinnerKcal: ""
                )
                single(.success(menu))
            }
            return Disposables.create()
        }
    }

    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenu]> {
        return Single.create { single -> Disposable in
            Task {
                let menuList = await self.store
                    .items
                    .filter {
                        $0.day.contains("\(day.toString(format: .year))-\(day.toString(format: .month))")
                    }

                single(.success(menuList))
            }

            return Disposables.create()
        }
    }
}
