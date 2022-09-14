import Foundation

import RxSwift

public class FetchUserListByClassUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    public func excute(
        grade: Int,
        classNumber: Int
    ) -> Observable<[ClassUserEntity]> {
        return repository.fetchUserListByClass(
            grade: grade,
            classNumber: classNumber
        )
    }
}
