import Foundation

import RxSwift

public protocol BugRepository {
    func postBugReport(reason: String, category: BugCategory, imageUrl: [String]) -> Completable
}
