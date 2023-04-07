import Foundation

import RxSwift

public class FetchTodaySelfStudyTeacherUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute(month: Date) -> Observable<[TodaySelfStudyTeacherEntity]> {
        self.repository.fetchTodaySelfStudyTeacher(month: month)
            .map { $0.filter { $0.teacher != ["", "", "", "", ""] } }
    }
}
