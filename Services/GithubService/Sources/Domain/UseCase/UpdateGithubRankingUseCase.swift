import Foundation

import RxSwift

public class UpdateGithubRankingUseCase {
    let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    public func execute() -> Completable {
        return repository.updateGithubRanking()
    }
}
