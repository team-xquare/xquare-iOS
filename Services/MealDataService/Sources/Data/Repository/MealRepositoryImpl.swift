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

    func fetchMealMenuPerDay(date: Date) -> Observable<MealMenuEntity> {
        OfflineCacheUtil<MealMenuEntity>()
            .localData {
                self.localDataSource.fetchMealMenuPerDay(
                    day: date
                )
            }
            .remoteData {
                self.remoteDataSource.fetchMealMenuPerDay(date: date.toString(format: .fullDate))
            }
            .doOnNeedRefresh { remoteData in
                self.localDataSource.registerMealMenuPerDay(menu: remoteData)
            }.createObservable()
    }

    func fetchMealMenuPerMonth(date: Date) -> Observable<[MealMenuEntity]> {
        OfflineCacheUtil<[MealMenuEntity]>()
            .localData {
                self.localDataSource.fetchMealMenuPerMonth(day: date)
            }
            .remoteData {
                self.remoteDataSource.fetchMealMenuPerMonth(
                    request: .init(
                        year: date.toString(format: .year),
                        month: date.toString(format: .mounth)
                    )
                )
            }
            .doOnNeedRefresh(refreshLocalData: { remoteData in
                self.localDataSource.registerMealMenuPerMonth(menu: remoteData)
            })
            .createObservable()
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
