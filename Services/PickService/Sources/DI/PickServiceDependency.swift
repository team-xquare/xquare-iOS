import Foundation

public struct PickServiceDependency {

    public static let shared = Self.resolve()

    public let fetchOutingPassUseCase: FetchOutingPassUseCase
    public let fetchMovedClassUseCase: FetchMovedClassUseCase
    public let fetchOutingReturnTimeUseCase: FetchOutingReturnTimeUseCase
    public let deleteReturnClassUseCase: DeleteReturnClassUseCase
}

extension PickServiceDependency {
    static func resolve() -> PickServiceDependency {
        // MARK: - Datasources
        let remoteDataSource: RemotePickDataSource = RemotePickDataSourceImpl()

        // MARK: - Respositories
        let repository: PickRepository = PickRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        // MARK: - UseCases
        let fetchOutingPassUseCase = FetchOutingPassUseCase(
            repository: repository
        )
        let fetchMovedClassUseCase = FetchMovedClassUseCase(
            repository: repository
        )
        let fetchOutingReturnTimeUseCase = FetchOutingReturnTimeUseCase(
            repository: repository
        )
        let deleteReturnClassUseCase = DeleteReturnClassUseCase(
            repository: repository
        )

        return PickServiceDependency(
            fetchOutingPassUseCase: fetchOutingPassUseCase,
            fetchMovedClassUseCase: fetchMovedClassUseCase,
            fetchOutingReturnTimeUseCase: fetchOutingReturnTimeUseCase,
            deleteReturnClassUseCase: deleteReturnClassUseCase
        )
    }
}
