import Foundation

import RxSwift

public protocol MealRepository {
    func fetchMealMenuPerDay(date: String) -> Single<MealMenuEntity>
    func fetchMealMenuPerMonth(date: Date) -> Single<[MealMenuEntity]>
}
