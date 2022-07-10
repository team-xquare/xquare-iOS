import Foundation

import RxSwift

public protocol MealRepository {
    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity>
    func fetchMonthtoMealMenu(request: MonthToMealMenuRequestEntity) -> Single<[MonthToMealMenuEntity]>
}
