import Foundation

import RxSwift

public class FetchPointHistoryUseCase {

    private let repository: PointRepository

    init(repository: PointRepository) {
        self.repository = repository
    }

    public func excute(type: Bool?) -> Observable<[PointHistoryEntity]> {
        return repository.fetchPointHistory(type: type)
    }

}
