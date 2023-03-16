import Foundation

import RxSwift

public class FetchMovedClassUseCase {

    private let pickRepository: PickRepository

    init(pickRepository: PickRepository) {
        self.pickRepository = pickRepository
    }

    public func excute() -> Single<MovedClassEntity> {
        self.pickRepository.fetchMovedClass()
    }
}
