import Foundation

import RxSwift
import RestApiModule

class RemoteGithubDataSourceImpl: RestApiRemoteDataSource<GithubAPI>, RemoteGithubDataSource {
    func registerGithubID(userName: String) -> RxSwift.Completable {
        return request(.registerGithubID(userName: userName))
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
}
