import Foundation

import RxSwift
import RestApiModule

class RemoteGithubDataSourceImpl: RestApiRemoteDataSource<GithubAPI>, RemoteGithubDataSource {
    func registerGithubID(code: String) -> Completable {
        return request(.registerGithubID(code: code))
            .asCompletable()
    }

    func updateGithubRanking() -> Completable {
        return request(.updateGithubRanking)
            .asCompletable()
    }

    func fetchMyGithubInfo() -> Single<GithubRankResponse> {
        return request(.fetchMyGithubInfo)
            .map(GithubRankResponse.self)
    }

    func fetchGithubInfoList() -> Single<GithubRankListResponse> {
        return request(.fetchGithubInfoList)
            .map(GithubRankListResponse.self)
    }

    func checkGithubConnecting() -> Single<GithubConnectCheckResponse> {
        return request(.checkGithubConnecting)
            .map(GithubConnectCheckResponse.self)
    }
}
