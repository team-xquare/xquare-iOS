import Foundation

import RxSwift
import RestApiModule

protocol RemotePickDataSource: RestApiRemoteDataSource<PickAPI> {
    func fetchOutingReturnTime() -> Single<OutingReturnTimeEntity>
    func fetchMovedClass() -> Single<MovedClassEntity>
    func fetchOutingPass() -> Single<OutingPassEntity>
    func fetchTodaySelfStudyTeacher(month: String) -> Single<[TodaySelfStudyTeacherEntity]>
    func deleteReturnClass() -> Completable
}
