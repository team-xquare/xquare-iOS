import Foundation

import Moya
import RxSwift
import RestApiModule

class RemoteBugDataSourceImpl: RestApiRemoteDataSource<BugAPI>, RemoteBugDataSource {
    private let provider = MoyaProvider<BugAPI>()

    func postBugReport(request: PostBugRequest) -> RxSwift.Completable {
        return provider.rx.request(.postBugReport(request: request))
            .asCompletable()
    }
}
