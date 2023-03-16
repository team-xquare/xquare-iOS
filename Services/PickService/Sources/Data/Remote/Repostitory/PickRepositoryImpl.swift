import Foundation

import RxSwift

class PickRepositoryImpl: PickRepository {
    private let remoteDataSource: RemotePickDataSource

    init(remoteDataSource: RemotePickDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchOutingReturnTime() -> Single<OutingReturnTimeEntity> {
        return remoteDataSource.fetchOutingReturnTime()
    }

    func fetchOutingPass() -> Single<OutingPassEntity> {
        return remoteDataSource.fetchOutingPass()
    }

    func fetchMovedClass() -> Single<MovedClassEntity> {
        return remoteDataSource.fetchMovedClass()
    }

}
