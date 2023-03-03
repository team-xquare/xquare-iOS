import Foundation

import RxSwift
import RestApiModule

class RemotePointDataSourceImpl: RestApiRemoteDataSource<PointAPI>, RemotePointDataSource {

    func fetchPointHistory(type: PointType) -> Single<PointEntity> {
        return request(.fetchPointHistory(type: type))
            .map(PointResponse.self)
            .map { $0.toDomain() }
    }

}
