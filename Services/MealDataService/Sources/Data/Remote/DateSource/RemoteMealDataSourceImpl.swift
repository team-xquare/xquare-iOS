import Foundation

import Moya
import RxSwift
import RxMoya
import RestApiModule

class RemoteMealDataSourceImpl: RestApiRemoteDataSource<MealAPI>, RemoteMealDataSource {

    func fetchDayToMealMenu(date: String) -> Single<MealMenuPerDayEntity> {
        return request(.fetchDayToMealMenu(date: date))
            .map(MealMenuPerDayResponse.self)
            .map { $0.toDomain() }
    }

    func fetchMonthToMealMenu(
        request mealRequest: MonthToMealMenuRequest
    ) -> Single<[[MealMenuEntity]]> {
        return request(.fetchMonthToMealMenu(
            request: mealRequest
        )).map(MealMenuListPerMonthResponse.self)
            .map { $0.toDomain() }
    }

}
