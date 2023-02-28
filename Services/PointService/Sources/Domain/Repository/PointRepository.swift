import Foundation

import RxSwift

protocol PointRepository {
    func fetchPoint() -> Single<PointEntity>
    func fetchPointHistory(type: Bool?) -> Observable<[PointHistoryEntity]>
}
