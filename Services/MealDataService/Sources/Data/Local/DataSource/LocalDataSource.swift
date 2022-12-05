import Foundation

import RxSwift

protocol LocalDataSource {
    func registerMealMenuPerDay(menu: MealMenu) throws
    func registerMealMenuPerMonth(menu: [MealMenu]) throws
    func fetchMealMenuPerDay(day: Date) -> Single<MealMenu>
    func fetchMealMenuPerMonth(day: Date) -> Single<[MealMenu]>
}
