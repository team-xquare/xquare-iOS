import Foundation

import Moya
import RxSwift
import RxMoya
import RestApiModule

class RemoteMealDataSourceImpl: RestApiRemoteDataSource<MealAPI>, RemoteMealDataSource {

    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity> {
        return request(.fetchDayToMealMenu(date: date))
            .map(DayToMealMenuResponse.self)
            .map { $0.toDomain() }
    }

    func fetchMonthToMealMenu(
        mealRequest: MonthToMealMenuRequest
    ) -> Single<[MonthToMealMenuEntity]> {
        return request(.fetchMonthToMealMenu(
            request: mealRequest
        )).map(MonthToMealMenuListResponse.self)
            .map { $0.toDomain() }
    }

}
