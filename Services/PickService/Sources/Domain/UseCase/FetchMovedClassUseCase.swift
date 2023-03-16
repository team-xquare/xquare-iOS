import Foundation

import RxSwift

public class FetchMovedClassUseCase {

    private let repository: PickRepository

    init(repository: PickRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<MovedClassEntity> {
        self.repository.fetchMovedClass()
    }
}
