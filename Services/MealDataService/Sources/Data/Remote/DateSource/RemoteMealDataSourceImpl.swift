import Foundation

import Moya
import RxSwift
import RxMoya

class RemoteMealDataSourceImpl: RemoteDataSource {

    private let provider = MoyaProvider<MealAPI>()

    func fetchDayToMealMenu(date: String) -> Observable<DayToMealMenuEntity> {
        return provider.rx.request(.fetchDayToMealMenu(date: date))
            .map(DayToMealMenuResponse.self)
            .map { $0.toDomain() }
            .asObservable()
    }

    func fetchMonthToMealMenu(
        year: String,
        month: String
    ) -> Observable<[MonthToMoealMenuEntity]> {
        return provider.rx.request(.fetchMonthToMealMenu(
            year: year,
            month: month
        )).map(MonthToMealMenuListResponse.self)
            .map { $0.toDomain() }
            .asObservable()
    }

}
