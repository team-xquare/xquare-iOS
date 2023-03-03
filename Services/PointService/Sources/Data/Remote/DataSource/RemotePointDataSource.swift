import Foundation

import RxSwift
import RestApiModule

protocol RemotePointDataSource: RestApiRemoteDataSource<PointAPI> {
    func fetchPointHistory(type: PointType) -> Single<PointEntity>
}
