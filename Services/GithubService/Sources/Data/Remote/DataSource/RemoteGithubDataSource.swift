import Foundation

import RxSwift
import RestApiModule

protocol RemoteGithubDataSource: RestApiRemoteDataSource<GithubAPI> {
    func registerGithubID(userName: String) -> Completable
    func fetchMyGithubInfo() -> Single<GithubRankResponse>
    func fetchGithubInfoList() -> Single<GithubRankListResponse>
}
