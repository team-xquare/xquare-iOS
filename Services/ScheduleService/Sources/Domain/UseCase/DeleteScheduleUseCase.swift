import Foundation

import RxSwift

public class DeleteScheduleUseCase {

    private let repository: ScheduleRepository

    init(repository: ScheduleRepository) {
        self.repository = repository
    }

    public func excute(scheduleId: String) -> Completable {
        return repository.deleteSchedule(scheduleId: scheduleId)
    }

}
