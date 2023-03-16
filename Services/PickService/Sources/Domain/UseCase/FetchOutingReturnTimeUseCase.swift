import Foundation

import RxSwift

public class FetchOutingReturnTimeUseCase {

    private let pickRepository: PickRepository

    init(pickRepository: PickRepository) {
        self.pickRepository = pickRepository
    }

    public func excute() -> Single<OutingReturnTimeEntity> {
        self.pickRepository.fetchOutingReturnTime()
    }
}
