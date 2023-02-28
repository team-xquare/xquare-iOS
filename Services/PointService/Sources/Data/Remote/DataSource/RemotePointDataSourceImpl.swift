import Foundation

import RxSwift
import RestApiModule

class RemotePointDataSourceImpl: RestApiRemoteDataSource<PointAPI>, RemotePointDataSource {

    func fetchPoint() -> Single<PointEntity> {
        return request(.fetchPoint)
            .map(PointResponse.self)
            .map { $0.toDomain() }
    }

    func fetchPointHistory(type: Bool?) -> Single<[PointHistoryEntity]> {
        return request(.fetchPointHistory(type: type))
            .map(PointHistoryListResponse.self)
            .map { $0.toDomain() }
    }

}
