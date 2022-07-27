import Foundation

import RxSwift

protocol LocalDataSource {
    func registerMealMenuPerDay(menu: MealMenuEntity)
    func registerMealMenuPerMonth(menu: [MealMenuEntity])
    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuEntity>
    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenuEntity]>
}
