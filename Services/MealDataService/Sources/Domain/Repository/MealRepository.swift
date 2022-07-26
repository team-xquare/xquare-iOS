import Foundation

import RxSwift

public protocol MealRepository {
    func fetchMealMenuPerDay(date: String) -> Single<MealMenuPerDayEntity>
    func fetchMealMenuPerMonth(date: Date) -> Single<[[MealMenuEntity]]>
}
