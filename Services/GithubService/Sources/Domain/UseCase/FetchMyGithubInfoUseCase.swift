import Foundation

import RxSwift

public class FetchMyGithubInfoUseCase {
    let repository: GithubRepositoryImpl

    init(repository: GithubRepositoryImpl) {
        self.repository = repository
    }

    func execute() -> Observable<GithubRankEntity> {
        return repository.fetchMyGithubInfo()
    }
}
