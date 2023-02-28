import Foundation

public struct PointServiceDependency {
    public static let shared = PointServiceDependency.resolve()

    public let fetchPointUseCase: FetchPointUseCase
    public let fetchPointHistoryUseCase: FetchPointHistoryUseCase
}

public extension PointServiceDependency {

    static func resolve() -> PointServiceDependency {
        let remoteDataSource = RemotePointDataSourceImpl()
        let repository = PointRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchPointUseCase = FetchPointUseCase(repository: repository)
        let fetchPointHistoryUseCase = FetchPointHistoryUseCase(repository: repository)

        return .init(
            fetchPointUseCase: fetchPointUseCase,
            fetchPointHistoryUseCase: fetchPointHistoryUseCase
        )
    }
}
