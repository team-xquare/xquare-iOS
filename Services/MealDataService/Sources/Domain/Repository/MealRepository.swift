import Foundation

import RxSwift

public protocol MealRepository {
    func fetchMealMenuPerDay(date: Date) -> Observable<MealMenuPerDayEntity>
    func fetchMealMenuPerMonth(date: Date) -> Observable<[MealMenuPerDayEntity]>
}
