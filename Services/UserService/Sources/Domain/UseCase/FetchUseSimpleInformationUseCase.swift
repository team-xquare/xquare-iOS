import Foundation

import RxSwift

public class FetchUserSimpleInformationUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute() -> Single<UserSimpleInformation> {
        return repository.fetchUserSimpleInformation()
    }
}
