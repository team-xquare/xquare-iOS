import Foundation

import RxSwift

public protocol ReportRepository {
    func postBugReport(reason: String, category: BugCategory, imageUrl: [String]) -> Completable
}
