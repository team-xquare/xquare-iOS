import Foundation

import RxSwift
import RestApiModule

protocol RemoteBugDataSource: RestApiRemoteDataSource<BugAPI> {
    func postBugReport(reason: String, category: BugCategory, imageUrl: [String]) -> Completable
}
