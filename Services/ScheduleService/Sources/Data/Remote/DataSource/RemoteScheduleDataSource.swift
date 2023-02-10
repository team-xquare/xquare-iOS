import Foundation

import RxSwift
import RestApiModule

protocol RemoteScheduleDataSource: RestApiRemoteDataSource<ScheduleAPI> {
    func fetchScheduleForMonth(month: Int) -> Single<[ScheduleEntity]>
    func createSchoolSchedule(name: String, date: String) -> Completable
    func createSchedule(name: String, date: String) -> Completable
}
