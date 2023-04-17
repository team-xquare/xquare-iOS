import Foundation

import RxSwift

public protocol BugRepository {
    func postBugReport(postBugEntity: PostBugReportEntity) -> Completable
}
