import Foundation

import RxSwift

public class FetchPointUseCase {

    private let repository: PointRepository

    init(repository: PointRepository) {
        self.repository = repository
    }

    public func excute() -> Single<PointEntity> {
        return repository.fetchPoint()
    }

}
