import Foundation

import RxSwift

public protocol PickRepository {
    func fetchOutingReturnTime() -> Observable<OutingReturnTimeEntity>
    func fetchOutingPass() -> Observable<OutingPassEntity>
    func fetchMovedClass() -> Observable<MovedClassEntity>
    func fetchTodaySelfStudyTeacher() -> Observable<TodaySelfStudyTeacherEntity>
    func deleteReturnClass() -> Completable
}
