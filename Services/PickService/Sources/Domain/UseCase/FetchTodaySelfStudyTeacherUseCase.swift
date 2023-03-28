import Foundation

import RxSwift

public class FetchTodaySelfStudyTeacherUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<TodaySelfStudyTeacherEntity> {
        self.repository.fetchTodaySelfStudyTeacher()
    }
}
