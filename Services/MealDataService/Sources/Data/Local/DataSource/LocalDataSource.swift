import Foundation

import RxSwift

protocol LocalDataSource {
    func registerMealMenuPerDay(day: Date, breakfast: [String], lunch: [String], dinner: [String])
    func registerMealMenuPerMonth(menu: [[MealMenuEntity]])
    func fetchMealMenuPerDay(day: Date) -> Single<MealMenuPerDayEntity>
    func fetchMealMenuPerMonth(day: Date) -> Single<[[MealMenuEntity]]>
}
