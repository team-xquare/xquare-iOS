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

    func fetchMealMenuPerDay(date: Date) -> Observable<MealMenuPerDayEntity> {
        OfflineCacheUtil<MealMenuPerDayEntity>()
            .localData {
                self.localDataSource.fetchMealMenuPerDay(day: date)
                    .map { $0.toDomain() }
            }
            .remoteData {
                self.remoteDataSource.fetchMealMenuPerDay(date: date.toString(format: .fullDate))
            }
            .doOnNeedRefresh { remoteData in
                self.localDataSource.registerMealMenuPerDay(menu: self.toMealMenu(remoteData))
            }.createObservable()
    }

    func fetchMealMenuPerMonth(date: Date) -> Observable<[MealMenuPerDayEntity]> {
        OfflineCacheUtil<[MealMenuPerDayEntity]>()
            .localData {
                self.localDataSource.fetchMealMenuPerMonth(day: date)
                    .map { $0.map { $0.toDomain() } }
            }
            .remoteData {
                self.remoteDataSource.fetchMealMenuPerMonth(
                    request: .init(
                        year: date.toString(format: .year),
                        month: date.toString(format: .month)
                    )
                )
            }
            .doOnNeedRefresh(refreshLocalData: { remoteData in
                self.localDataSource.registerMealMenuPerMonth(menu: remoteData.map { self.toMealMenu($0) })
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

    private func toMealMenu(_ menu: MealMenuPerDayEntity) -> MealMenu {
        var breakfast: String = ""
        var lunch: String = ""
        var dinner: String = ""
        var breakfaseKcal: String = ""
        var lunchKcal: String = ""
        var dinnerKcal: String = ""
        for menu in menu.menu {
            switch menu.mealTime {
            case .breakfast:
                breakfast = menu.menu?.joined(separator: ", ") ?? ""
                breakfaseKcal = menu.kcal
            case .lunch:
                lunch = menu.menu?.joined(separator: ", ") ?? ""
                lunchKcal = menu.kcal
            case .dinner:
                dinner = menu.menu?.joined(separator: ", ") ?? ""
                dinnerKcal = menu.kcal
            }
        }
        return MealMenu(
            day: menu.date,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner,
            breakfastKcal: breakfaseKcal,
            lunchKcal: lunchKcal,
            dinnerKcal: dinnerKcal
        )
    }
}
