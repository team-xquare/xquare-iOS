import Foundation

import RxSwift

class BugRepositoryImpl: BugRepository {

    private let remoteDataSource: RemoteBugDataSource

    init(remoteDataSource: RemoteBugDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func postBugReport(postBugEntity: PostBugReportEntity) -> RxSwift.Completable {
        self.remoteDataSource.postBugReport(requests: postBugEntity.toBugReportRequest())
    }
}
