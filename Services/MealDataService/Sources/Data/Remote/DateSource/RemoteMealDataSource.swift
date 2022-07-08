import Foundation

import RestApiModule
import RxSwift

protocol RemoteMealDataSource: RestApiRemoteDataSource<MealAPI> {
    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity>
    func fetchMonthToMealMenu(year: String, month: String) -> Single<[MonthToMealMenuEntity]>
}
