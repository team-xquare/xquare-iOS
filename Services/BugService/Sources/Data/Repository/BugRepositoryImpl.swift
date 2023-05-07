import Foundation

import RxSwift

class BugRepositoryImpl: BugRepository {

    private let remoteDataSource: RemoteBugDataSource

    init(remoteDataSource: RemoteBugDataSource) {
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
