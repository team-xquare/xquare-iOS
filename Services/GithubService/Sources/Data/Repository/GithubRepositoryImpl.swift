import Foundation

import RxSwift

class GithubRepositoryImpl: GithubRepository {
    let remoteDataSource: RemoteGithubDataSource

    init(remoteDataSource: RemoteGithubDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func registerGithubID(userID: String) -> Completable {
        return remoteDataSource.registerGithubID(userName: userID)
    }

    func fetchMyGithubInfo() -> Observable<GithubRankEntity> {
        return remoteDataSource.fetchMyGithubInfo()
            .map { $0.toDomain() }
            .asObservable()
    }

    func fetchGithubInfoList() -> Observable<GithubRankListEntity> {
        return remoteDataSource.fetchGithubInfoList()
            .map { $0.toDomain() }
            .asObservable()
    }
}
