import Foundation

import Moya
import RxSwift
import RxMoya
import RestApiModule

class RemoteMealDataSourceImpl: RestApiRemoteDataSource<MealAPI>, RemoteMealDataSource {

    func fetchMealMenuPerDay(date: String) -> Single<MealMenuEntity> {
        return request(.fetchMealMenuPerDay(date: date))
            .map(MealMenuPerDayResponse.self)
            .map { $0.toDomain() }
    }

    func fetchMealMenuPerMonth(request mealRequest: MonthToMealMenuRequest) -> Single<[MealMenuEntity]> {
        return request(.fetchMealMenuPerMonth(request: mealRequest))
            .map(MealMenuListPerMonthResponse.self)
            .map { $0.toDomain() }
    }

}
