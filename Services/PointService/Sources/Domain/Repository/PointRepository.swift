import Foundation

import RxSwift

protocol PointRepository {
    func fetchPointHistory(type: Bool?) -> Observable<PointEntity>
}
