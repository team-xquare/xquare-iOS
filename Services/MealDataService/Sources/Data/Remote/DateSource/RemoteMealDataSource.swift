import Foundation

import RestApiModule
import RxSwift

protocol RemoteMealDataSource: RestApiRemoteDataSource<MealAPI> {
    func fetchMealMenuPerDay(date: String) -> Single<MealMenuPerDayEntity>
    func fetchMealMenuPerMonth(request: MonthToMealMenuRequest) -> Single<[MealMenuPerDayEntity]>
}
