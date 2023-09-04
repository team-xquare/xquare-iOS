import Foundation

import RxSwift

protocol LocalScheduleDataSource {
    func registerScheduleForMonth(schedules: [ScheduleForMonth]) throws
    func fetchScheduleForMonth(month: Int) -> Single<[ScheduleForMonth]>
}
