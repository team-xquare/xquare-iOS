import Foundation

import RxSwift

class ReportRepositoryImpl: ReportRepository {

    private let remoteDataSource: RemoteReportDataSource

    init(remoteDataSource: RemoteReportDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func postBugReport(
        reason: String,
        category: BugCategory,
        imageUrl: [String]
    ) -> Completable {
        return remoteDataSource.postBugReport(
            reason: reason,
            category: category,
            imageUrl: imageUrl
        )
    }
}
