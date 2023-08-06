import Foundation

import RxSwift

public class CheckGithubConnectingUseCase {
    let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    public func execute() -> Observable<GithubConnectCheckEntity> {
        return repository.checkGithubConnecting()
    }
}
