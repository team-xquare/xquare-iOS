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

    func editShceudle(scheduleId: String, name: String, date: String) -> Completable {
        return request(.editSchedule(scheduleId: scheduleId, name: name, date: date))
            .asCompletable()
    }

    func deleteSchedule(scheduleId: String) -> Completable {
        return request(.deleteSchedule(scheduelId: scheduleId))
            .asCompletable()
    }

}
