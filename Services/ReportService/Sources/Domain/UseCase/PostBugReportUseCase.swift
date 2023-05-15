import Foundation

import RxSwift

public class PostBugReportUseCase {

    private let repository: ReportRepository

    init(repository: ReportRepository) {
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
