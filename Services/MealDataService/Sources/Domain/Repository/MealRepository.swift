import Foundation

import RxSwift

public protocol MealRepository {
    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity>
    func fetchMonthtoMealMenu(year: String, month: String) -> Single<[MonthToMealMenuEntity]>
}
