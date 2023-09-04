import Foundation

import RxSwift

public class FetchMyGithubInfoUseCase {
    let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    public func execute() -> Observable<GithubRankEntity> {
        return repository.fetchMyGithubInfo()
    }
}
