import Foundation

import RxSwift

public protocol ScheduleRepository {
    func fetchScheduleForMonth(month: Int) -> Observable<[ScheduleEntity]>
    func createSchoolSchedule(name: String, date: String) -> Completable
    func createSchedule(name: String, date: String) -> Completable
}
