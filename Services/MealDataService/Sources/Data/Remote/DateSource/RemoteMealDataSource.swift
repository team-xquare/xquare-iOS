import Foundation

import RestApiModule
import RxSwift

protocol RemoteMealDataSource: RestApiRemoteDataSource<MealAPI> {
    func fetchMealMenuPerDay(date: String) -> Single<MealMenuEntity>
    func fetchMealMenuPerMonth(request: MonthToMealMenuRequest) -> Single<[MealMenuEntity]>
}
