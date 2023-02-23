import Foundation

import RxSwift

public protocol ScheduleRepository {
    func fetchScheduleForMonth(month: Int) -> Observable<[ScheduleEntity]>
    func createSchedule(name: String, date: String) -> Completable
}
