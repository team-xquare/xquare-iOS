import Foundation

public struct ReportServiceDependency {

    public static let shared = Self.resolve()

    public let postBugReportUseCase: PostBugReportUseCase
    public let fetchReleaseNoteUseCase: FetchReleaseNoteUseCase
}

extension ReportServiceDependency {
    static func resolve() -> ReportServiceDependency {
        // MARK: - Datasources
        let remoteReportDataSource: RemoteReportDataSource = RemoteReportDataSourceImpl()

        // MARK: - Respositories
        let reportRepository: ReportRepository = ReportRepositoryImpl(
            remoteDataSource: remoteReportDataSource
        )

        // MARK: - UseCases
        let postBugReportUseCase = PostBugReportUseCase(
            repository: reportRepository
        )
        let fetchReleaseNoteUseCase = FetchReleaseNoteUseCase(
            repository: reportRepository
        )

        return ReportServiceDependency(
            postBugReportUseCase: postBugReportUseCase,
            fetchReleaseNoteUseCase: fetchReleaseNoteUseCase
        )
    }
}
