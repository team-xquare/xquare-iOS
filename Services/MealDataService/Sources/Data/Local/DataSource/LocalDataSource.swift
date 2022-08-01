import Foundation

import RxSwift

protocol LocalDataSource {
    func registerMealMenuPerDay(menu: MealMenuPerDayEntity)
    func registerMealMenuPerMonth(menu: [MealMenuPerDayEntity])
    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuPerDayEntity>
    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenuPerDayEntity]>
}
