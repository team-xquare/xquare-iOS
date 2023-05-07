import Foundation

import RxSwift

public class PostBugReportUseCase {

    private let repository: BugRepository

    init(repository: BugRepository) {
        self.repository = repository
    }

    public func excute(
        reason: String,
        category: BugCategory,
        imageUrl: [String]
    ) -> Completable {
        return repository.postBugReport(reason: reason, category: category, imageUrl: imageUrl)
    }

}
