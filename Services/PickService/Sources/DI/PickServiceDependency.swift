import Foundation

public struct PickServiceDependency {

    public static let shared = Self.resolve()

    public let fetchOutingPassUseCase: FetchOutingPassUseCase
    public let fetchMovedClassUseCase: FetchMovedClassUseCase
    public let fetchOutingReturnTimeUseCase: FetchOutingReturnTimeUseCase

}

extension PickServiceDependency {
    static func resolve() -> PickServiceDependency {
        // MARK: - Datasources
        let remotePickDataSource: RemotePickDataSource = RemotePickDataSourceImpl()

        // MARK: - Respositories
        let pickRepository: PickRepository = PickRepositoryImpl(
            remoteDataSource: remotePickDataSource
        )

        // MARK: - UseCases
        let fetchOutingPassUseCase = FetchOutingPassUseCase(
            repository: pickRepository
        )
        let fetchMovedClassUseCase = FetchMovedClassUseCase(
            repository: pickRepository
        )
        let fetchOutingReturnTimeUseCase = FetchOutingReturnTimeUseCase(
            repository: pickRepository
        )

        return PickServiceDependency(
            fetchOutingPassUseCase: fetchOutingPassUseCase,
            fetchMovedClassUseCase: fetchMovedClassUseCase,
            fetchOutingReturnTimeUseCase: fetchOutingReturnTimeUseCase
        )
    }
}
