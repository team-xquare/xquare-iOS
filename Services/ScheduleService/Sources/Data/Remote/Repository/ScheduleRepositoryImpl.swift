import Foundation

import RxSwift

public class ScheduleRepositoryImpl: ScheduleRepository {

    let remoteDataSource: RemoteScheduleDataSource

    init(remoteDataSource: RemoteScheduleDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchScheduleForMonth(month: Int) -> Observable<[ScheduleEntity]> {
        return remoteDataSource.fetchScheduleForMonth(month: month)
            .asObservable()
    }

    public func createSchoolSchedule(name: String, date: String) -> Completable {
        return remoteDataSource.createSchoolSchedule(name: name, date: date)
    }

    public func createSchedule(name: String, date: String) -> Completable {
        return remoteDataSource.createSchedule(name: name, date: date)
    }

}
