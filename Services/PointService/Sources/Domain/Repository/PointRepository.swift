import Foundation

import RxSwift

protocol PointRepository {
    func fetchPointHistory(type: PointType) -> Observable<PointEntity>
}
