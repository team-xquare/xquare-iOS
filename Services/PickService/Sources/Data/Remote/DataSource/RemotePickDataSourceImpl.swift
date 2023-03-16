import Foundation
import RxSwift
import RestApiModule

class RemotePointDataSourceImpl: RestApiRemoteDataSource<PickAPI>, RemotePickDataSource {

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
        return request(.fetchMovedClass)
            .map(OutingPassResponse.self)
            .map { $0.toDomain() }
    }

}
