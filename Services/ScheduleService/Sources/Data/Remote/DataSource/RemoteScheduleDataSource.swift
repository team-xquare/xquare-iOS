import Foundation

import RxSwift
import RestApiModule

protocol RemoteScheduleDataSource: RestApiRemoteDataSource<ScheduleAPI> {
    func fetchScheduleForMonth(month: Int) -> Single<[ScheduleEntity]>
    func createSchedule(name: String, date: String) -> Completable
}
