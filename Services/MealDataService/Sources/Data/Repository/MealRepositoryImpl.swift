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
        return remoteDataSource.fetchDayToMealMenu(date: date)
            .do(onSuccess: { data in
                OfflineCacheUtil<DayToMealMenuEntity>()
                    .localData {
                        self.localDataSource.fetchMealMenuPerDay(
                            day: date.toDate(format: .fullDate)
                        )
                    }
                    .remoteData {
                        self.remoteDataSource.fetchDayToMealMenu(date: date)
                    }
                    .doOnNeedRefresh { _ in
                        self.localDataSource.registerDayToMealMenu(
                            day: date.toDate(format: .fullDate),
                            breakfast: data.breakfast,
                            lunch: data.lunch,
                            dinner: data.dinner
                        )
                    }
            }).catch { [weak self] error in
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 408: return .error(MealServiceError.timeOut)
                case 429: return .error(MealServiceError.tooManyRequests)
                default: return .error(error)
                }
            }
    }

    func fetchMonthtoMealMenu(
        request: MonthToMealMenuRequestEntity
    ) -> Single<[MonthToMealMenuEntity]> {
        return remoteDataSource.fetchMonthToMealMenu(mealRequest: request.toMonthToMealMenuRequest()
            ).catch { [weak self] error in
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 408: return .error(MealServiceError.timeOut)
                case 429: return .error(MealServiceError.tooManyRequests)
                default: return .error(error)
                }
            }
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
