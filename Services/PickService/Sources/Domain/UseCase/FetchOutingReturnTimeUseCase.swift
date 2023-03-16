import Foundation

import RxSwift

public class FetchOutingReturnTimeUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<OutingReturnTimeEntity> {
        self.repository.fetchOutingReturnTime()
    }
}
