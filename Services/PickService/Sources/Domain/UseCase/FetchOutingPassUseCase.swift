import Foundation

import RxSwift

public class FetchOutingPassUseCase {

    private let pickRepository: PickRepository

    init(pickRepository: PickRepository) {
        self.pickRepository = pickRepository
    }

    public func excute() -> Single<OutingPassEntity> {
        self.pickRepository.fetchOutingPass()
    }

}
