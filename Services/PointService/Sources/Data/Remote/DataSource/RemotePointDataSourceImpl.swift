import Foundation

import RxSwift
import RestApiModule

class RemotePointDataSourceImpl: RestApiRemoteDataSource<PointAPI>, RemotePointDataSource {

    func fetchPointHistory(type: Bool) -> Single<PointEntity> {
        return request(.fetchPointHistory(type: type))
            .map(PointResponse.self)
            .map { $0.toDomain() }
    }

}
