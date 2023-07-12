import Foundation

import RxSwift

public class RegisterGithubIDUseCase {
    let repository: GithubRepositoryImpl

    init(repository: GithubRepositoryImpl) {
        self.repository = repository
    }

    func execute(userID: String) -> Completable {
        return repository.registerGithubID(userID: userID)
    }
}
