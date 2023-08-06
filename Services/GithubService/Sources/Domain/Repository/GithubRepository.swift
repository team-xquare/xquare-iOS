import Foundation

import RxSwift

protocol GithubRepository {
    func registerGithubID(code: String) -> Completable
    func updateGithubRanking() -> Completable
    func fetchMyGithubInfo() -> Observable<GithubRankEntity>
    func fetchGithubInfoList() -> Observable<GithubRankListEntity>
    func checkGithubConnecting() -> Observable<GithubConnectCheckEntity>
}
