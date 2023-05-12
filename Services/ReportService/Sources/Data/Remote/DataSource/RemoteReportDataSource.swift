import Foundation

import RxSwift
import RestApiModule

protocol RemoteReportDataSource: RestApiRemoteDataSource<ReportAPI> {
    func postBugReport(reason: String, category: BugCategory, imageUrl: [String]) -> Completable
    func fetchReleaseNote() -> Single<[ReleaseNoteEntity]>
}
