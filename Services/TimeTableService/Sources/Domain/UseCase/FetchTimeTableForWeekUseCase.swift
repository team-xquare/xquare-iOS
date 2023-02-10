import Foundation

import RxSwift

public class FetchTimeTableForWeekUseCase {

    private let repository: TimeTableRepository

    init(repository: TimeTableRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[WeekTimeTableEntity]> {
        return repository.fetchTimeTableForWeek()
    }

}
