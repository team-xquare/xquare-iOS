import Foundation

import RxSwift
import RestApiModule

protocol RemoteGithubDataSource: RestApiRemoteDataSource<GithubAPI> {
    func registerGithubID(code: String) -> Completable
    func updateGithubRanking() -> Completable
    func fetchMyGithubInfo() -> Single<GithubRankResponse>
    func fetchGithubInfoList() -> Single<GithubRankListResponse>
    func checkGithubConnecting() -> Single<GithubConnectCheckResponse>
}
