import Foundation

public struct PointServiceDependency {
    public static let shared = PointServiceDependency.resolve()

    public let fetchPointHistoryUseCase: FetchPointHistoryUseCase
}

public extension PointServiceDependency {

    static func resolve() -> PointServiceDependency {
        let remoteDataSource = RemotePointDataSourceImpl()
        let repository = PointRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchPointHistoryUseCase = FetchPointHistoryUseCase(repository: repository)

        return .init(
            fetchPointHistoryUseCase: fetchPointHistoryUseCase
        )
    }
}
