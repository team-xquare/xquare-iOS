import Foundation

import RxSwift

public class PostBugReportUseCase {

    private let repository: BugRepository

    init(repository: BugRepository) {
        self.repository = repository
    }

    public func excute(data: PostBugReportEntity) -> Completable {
        self.repository.postBugReport(postBugEntity: data)
    }

}
