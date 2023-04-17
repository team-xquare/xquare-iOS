import Foundation

public struct BugServiceDependency {

    public static let shared = Self.resolve()

    public let postBugReportUseCase: PostBugReportUseCase

}

extension BugServiceDependency {
    static func resolve() -> BugServiceDependency {
        // MARK: - Datasources
        let remoteBugDataSource: RemoteBugDataSource = RemoteBugDataSourceImpl()

        // MARK: - Respositories
        let bugRepository: BugRepository = BugRepositoryImpl(
            remoteDataSource: remoteBugDataSource
        )

        // MARK: - UseCases
        let postBugReportUseCase = PostBugReportUseCase(
            repository: bugRepository
        )

        return BugServiceDependency(
            postBugReportUseCase: postBugReportUseCase
        )
    }
}
