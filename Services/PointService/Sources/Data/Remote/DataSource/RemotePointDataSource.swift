import Foundation

import RxSwift
import RestApiModule

protocol RemotePointDataSource: RestApiRemoteDataSource<PointAPI> {
    func fetchPoint() -> Single<PointEntity>
    func fetchPointHistory(type: Bool?) -> Single<[PointHistoryEntity]>
}
