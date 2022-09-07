import Foundation

import RxSwift

protocol LocalDataSource {
    func registerMealMenuPerDay(menu: MealMenu)
    func registerMealMenuPerMonth(menu: [MealMenu])
    func fetchMealMenuPerDay(day: Date) -> Single<MealMenu>
    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenu]>
}
