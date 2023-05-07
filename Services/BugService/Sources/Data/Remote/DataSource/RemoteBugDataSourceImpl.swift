import Foundation

import Moya
import RxSwift
import RestApiModule

class RemoteBugDataSourceImpl: RestApiRemoteDataSource<BugAPI>, RemoteBugDataSource {
    func postBugReport(requests: PostBugRequest) -> RxSwift.Completable {
        return request(.postBugReport(request: requests))
            .asCompletable()
    }
}
