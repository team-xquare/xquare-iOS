import Foundation

import RxSwift

protocol GithubRepository {
    func registerGithubID(userID: String) -> Completable
    func fetchMyGithubInfo() -> Observable<GithubRankEntity>
    func fetchGithubInfoList() -> Observable<GithubRankListEntity>
}
