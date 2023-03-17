import Foundation

import RxSwift

public class DeleteReturnClassUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        self.repository.deleteReturnClass()
    }
}
