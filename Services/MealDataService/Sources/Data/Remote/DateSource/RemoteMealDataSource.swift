import Foundation

import RestApiModule
import RxSwift

protocol RemoteMealDataSource: RestApiRemoteDataSource<MealAPI> {
    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity>
    func fetchMonthToMealMenu(mealRequest: MonthToMealMenuRequest) -> Single<[MonthToMealMenuEntity]>
}
