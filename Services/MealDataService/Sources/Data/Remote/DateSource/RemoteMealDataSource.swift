import Foundation

import RestApiModule
import RxSwift

protocol RemoteMealDataSource: RestApiRemoteDataSource<MealAPI> {
    func fetchDayToMealMenu(date: String) -> Single<MealMenuPerDayEntity>
    func fetchMonthToMealMenu(request: MonthToMealMenuRequest) -> Single<[[MealMenuEntity]]>
}
