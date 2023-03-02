import Foundation

import RxSwift
import RestApiModule

protocol RemotePointDataSource: RestApiRemoteDataSource<PointAPI> {
    func fetchPointHistory(type: Bool) -> Single<PointEntity>
}
