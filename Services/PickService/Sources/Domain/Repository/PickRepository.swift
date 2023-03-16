import Foundation

import RxSwift

public protocol PickRepository {
    func fetchOutingReturnTime() -> Single<OutingReturnTimeEntity>
    func fetchOutingPass() -> Single<OutingPassEntity>
    func fetchMovedClass() -> Single<MovedClassEntity>
}
