import Foundation

import RxSwift
import XDateUtil

public class FetchScheduleForMonthUseCase {

    private let repository: ScheduleRepository

    init(repository: ScheduleRepository) {
        self.repository = repository
    }

    public func excute(month: Date) -> Observable<[ScheduleEntity]> {
        return repository.fetchScheduleForMonth(month: Int(month.toString(format: .month)) ?? 0)
    }

}
