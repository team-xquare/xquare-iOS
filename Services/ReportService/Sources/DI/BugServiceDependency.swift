import Foundation

public struct ReportServiceDependency {

    public static let shared = Self.resolve()

    public let postBugReportUseCase: PostBugReportUseCase

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

        return ReportServiceDependency(
            postBugReportUseCase: postBugReportUseCase
        )
    }
}
