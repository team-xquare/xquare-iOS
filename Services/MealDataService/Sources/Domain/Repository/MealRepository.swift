import Foundation

import RxSwift

public protocol MealRepository {
    func fetchMealMenuPerDay(date: Date) -> Observable<MealMenuEntity>
    func fetchMealMenuPerMonth(date: Date) -> Observable<[MealMenuEntity]>
}
