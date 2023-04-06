import Foundation

import Moya
import RxSwift
import RestApiModule

class RemotePickDataSourceImpl: RestApiRemoteDataSource<PickAPI>, RemotePickDataSource {

    func fetchOutingReturnTime() -> Single<OutingReturnTimeEntity> {
        return request(.fetchOutingReturnTime)
            .map(OutingReturnTimeResponse.self)
            .map { $0.toDomain() }
    }
    func fetchMovedClass() -> Single<MovedClassEntity> {
        return request(.fetchMovedClass)
            .map(MovedClassResponse.self)
            .map { $0.toDomain() }
    }
    func fetchOutingPass() -> Single<OutingPassEntity> {
        return request(.fetchOutingPass)
            .map(OutingPassResponse.self)
            .map { $0.toDomain() }
    }
    func deleteReturnClass() -> Completable {
        return request(.deleteReturnClass)
            .asCompletable()
    }

    func fetchTodaySelfStudyTeacher(month: String) -> Single<[TodaySelfStudyTeacherEntity]> {
        return request(.fetchTodaySelfStudyTeacher(month: month))
            .map(TodaySelfStudyTeacherListResponse.self)
            .map { $0.toDomain() }
    }

}
