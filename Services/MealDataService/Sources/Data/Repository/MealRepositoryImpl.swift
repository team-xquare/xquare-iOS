import Foundation

import RxOfflineCacheModule
import Moya
import RxSwift

class MealRepositoryImpl: MealRepository {

    let remoteDataSource: RemoteMealDataSource
    let localDataSource: LocalDataSource

    init(
        remoteDataSource: RemoteMealDataSource,
        localDataSource: LocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity> {
        OfflineCacheUtil<DayToMealMenuEntity>()
            .localData {
                self.localDataSource.fetchMealMenuPerDay(
                    day: date.toDate(format: .fullDate)
                )
            }
            .remoteData {
                self.remoteDataSource.fetchDayToMealMenu(date: date)
            }
            .doOnNeedRefresh { remoteData in
                self.localDataSource.registerDayToMealMenu(
                    day: date.toDate(format: .fullDate),
                    breakfast: remoteData.breakfast,
                    lunch: remoteData.lunch,
                    dinner: remoteData.dinner
                )
            }.createObservable()
            .asSingle()
    }

    func fetchMonthtoMealMenu(
        request: MonthToMealMenuRequestEntity
    ) -> Single<[MonthToMealMenuEntity]> {
        OfflineCacheUtil<[MonthToMealMenuEntity]>()
            .localData {
                self.localDataSource.fetchMealMenuPerMonth(day: request.day)
            }
            .remoteData {
                self.remoteDataSource.fetchMonthToMealMenu(
                    mealRequest: request.toMonthToMealMenuRequest()
                )
            }.createObservable()
            .asSingle()
    }
}

extension MealRepositoryImpl {

    private func errorToStatusCode(_ error: Error) -> Int? {
        guard let statusCode = (error as? MoyaError)?.response?.statusCode else {
            return nil
        }
        return statusCode
    }

}
