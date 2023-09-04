import Foundation

import RxSwift

public class FetchGithubInfoListUseCase {
    let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    public func execute() -> Observable<GithubRankListEntity> {
        return repository.fetchGithubInfoList()
    }
}
