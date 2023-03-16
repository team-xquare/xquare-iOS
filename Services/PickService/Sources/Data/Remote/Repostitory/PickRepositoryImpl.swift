import Foundation

import RxSwift

class PickRepositoryImpl: PickRepository {
    private let remoteDataSource: RemotePickDataSource

    init(remoteDataSource: RemotePickDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchOutingReturnTime() -> Observable<OutingReturnTimeEntity> {
        return remoteDataSource.fetchOutingReturnTime()
            .asObservable()
    }

    func fetchOutingPass() -> Observable<OutingPassEntity> {
        return remoteDataSource.fetchOutingPass()
            .asObservable()
    }

    func fetchMovedClass() -> Observable<MovedClassEntity> {
        return remoteDataSource.fetchMovedClass()
            .asObservable()
    }

    func deleteReturnClass(period: Int) -> Completable {
        return remoteDataSource.deleteReturnClass(period: period)
    }

}
