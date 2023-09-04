import Foundation

import RxSwift

class GithubRepositoryImpl: GithubRepository {
    let remoteDataSource: RemoteGithubDataSource

    init(remoteDataSource: RemoteGithubDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func registerGithubID(code: String) -> Completable {
        return remoteDataSource.registerGithubID(code: code)
    }

    func updateGithubRanking() -> Completable {
        return remoteDataSource.updateGithubRanking()
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

    func checkGithubConnecting() -> Observable<GithubConnectCheckEntity> {
        return remoteDataSource.checkGithubConnecting()
            .map { $0.toDomain() }
            .asObservable()
    }
}
