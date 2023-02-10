import Foundation

import RxSwift
import RestApiModule

class RemoteScheduleDataSourceImpl: RestApiRemoteDataSource<ScheduleAPI>, RemoteScheduleDataSource {

    func fetchScheduleForMonth(month: Int) -> Single<[ScheduleEntity]> {
        return request(.fetchScheduleForMonth(month: month))
            .map(ScheduleListResponse.self)
            .map { $0.toDomain() }
    }

    func createSchedule(name: String, date: String) -> Completable {
        return request(.createSchedule(name: name, date: date))
            .asCompletable()
    }

}
