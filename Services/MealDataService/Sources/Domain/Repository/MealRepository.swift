import Foundation

import RxSwift

public protocol MealRepository {
    func fetchDayToMealMenu(date: String) -> Observable<DayToMealMenuEntity>
    func fetchMonthtoMealMenu(year: String, month: String) -> Observable<[MonthToMealMenuEntity]>
}
