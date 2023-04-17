import Foundation

import RxSwift
import RestApiModule

protocol RemoteBugDataSource: RestApiRemoteDataSource<BugAPI> {
    func postBugReport(request: PostBugRequest) -> Single<PostBugReportResponse>
}
