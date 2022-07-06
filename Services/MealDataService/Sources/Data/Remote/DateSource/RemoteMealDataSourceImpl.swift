import Foundation

import Moya
import RxSwift
import RxMoya
import RestApiModule

class RemoteMealDataSourceImpl: RestApiRemoteDataSource<MealAPI> {

    func fetchDayToMealMenu(date: String) -> Observable<DayToMealMenuEntity> {
        return request(.fetchDayToMealMenu(date: date))
            .map(DayToMealMenuResponse.self)
            .map { $0.toDomain() }
            .asObservable()
    }

    func fetchMonthToMealMenu(
        year: String,
        month: String
    ) -> Observable<[MonthToMealMenuEntity]> {
        return request(.fetchMonthToMealMenu(
            year: year,
            month: month
        )).map(MonthToMealMenuListResponse.self)
            .map { $0.toDomain() }
            .asObservable()
    }

}
