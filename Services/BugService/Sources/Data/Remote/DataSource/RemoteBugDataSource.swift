import Foundation

import RxSwift
import RestApiModule

protocol RemoteBugDataSource: RestApiRemoteDataSource<BugAPI> {
    func postBugReport(requests: PostBugRequest) -> Completable
}
