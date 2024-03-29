import Foundation

import RxSwift
import XDateUtil

public class CreateScheduleUseCase {

    private let repository: ScheduleRepository

    init(repository: ScheduleRepository) {
        self.repository = repository
    }

    public func excute(name: String, date: Date) -> Completable {
        return repository.createSchedule(name: name, date: date.toString(format: .fullDate))
    }

}
