import Foundation

import Moya
import RxSwift

class MealRepositoryImpl: MealRepository {

    let remoteDataSource: RemoteMealDataSource

    init(remoteDataSource: RemoteMealDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchDayToMealMenu(date: String) -> Single<DayToMealMenuEntity> {
        return remoteDataSource.fetchDayToMealMenu(date: date)
            .catch { [weak self] error in
                guard let errorCode = self?.errorToStatusCode(error) else { return .error(error) }
                switch errorCode {
                case 408: return .error(MealServiceError.timeOut)
                case 429: return .error(MealServiceError.tooManyRequests)
                default: return .error(error)
                }
            }
    }

    func fetchMonthtoMealMenu(
        year: String,
        month: String
    ) -> Single<[MonthToMealMenuEntity]> {
        return remoteDataSource.fetchMonthToMealMenu(
            year: year,
            month: month
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
