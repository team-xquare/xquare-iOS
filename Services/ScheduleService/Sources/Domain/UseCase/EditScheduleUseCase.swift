import Foundation

import RxSwift

public class EditScheduleUseCase {

    private let repository: ScheduleRepository

    init(repository: ScheduleRepository) {
        self.repository = repository
    }

    public func excute(scheduleId: String, name: String, date: String) -> Completable {
        return repository.editSchedule(scheduleId: scheduleId, name: name, date: date)
    }

}
