import Foundation

import RxSwift

public class FetchOutingPassUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<OutingPassEntity> {
        self.repository.fetchOutingPass()
    }

}
