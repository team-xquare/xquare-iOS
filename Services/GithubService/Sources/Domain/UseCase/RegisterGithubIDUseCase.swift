import Foundation

import RxSwift

public class RegisterGithubIDUseCase {
    let repository: GithubRepository

    init(repository: GithubRepository) {
        self.repository = repository
    }

    public func execute(code: String) -> Completable {
        return repository.registerGithubID(code: code)
    }
}
