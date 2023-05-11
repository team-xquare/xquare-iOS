import Foundation

import Moya
import RxSwift
import RestApiModule

class RemoteReportDataSourceImpl: RestApiRemoteDataSource<ReportAPI>, RemoteReportDataSource {
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
