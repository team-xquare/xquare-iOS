import Foundation

import RxSwift

public class FetchPointHistoryUseCase {

    private let repository: PointRepository

    init(repository: PointRepository) {
        self.repository = repository
    }

    public func excute(type: PointType) -> Observable<PointEntity> {
        return repository.fetchPointHistory(type: type)
    }

}
