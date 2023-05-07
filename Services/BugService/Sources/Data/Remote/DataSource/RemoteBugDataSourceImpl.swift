import Foundation

import Moya
import RxSwift
import RestApiModule

class RemoteBugDataSourceImpl: RestApiRemoteDataSource<BugAPI>, RemoteBugDataSource {
    func postBugReport(
        reason: String,
        category: BugCategory,
        imageUrl: [String]
    ) -> Completable {
        return request(.postBugReport(
            reason: reason,
            category: category,
            imageUrl: imageUrl
        ))
            .asCompletable()
    }
}
