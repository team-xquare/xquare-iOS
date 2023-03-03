import Foundation

import RxSwift

class PointRepositoryImpl: PointRepository {

    let remoteDataSource: RemotePointDataSource

    init(remoteDataSource: RemotePointDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchPointHistory(type: PointType) -> Observable<PointEntity> {
        return remoteDataSource.fetchPointHistory(type: type)
            .asObservable()
    }

}
