import Foundation

public struct ScheduleServiceDependency {
    public static let shared = Self.resolve()

    public let fetchScheduleForMonthUseCase: FetchSchedulePerMonthUseCase
    public let createScheduleUseCase: CreateScheduleUseCase
    public let editScheduleUseCase: EditScheduleUseCase
    public let deleteScheduleUseCase: DeleteScheduleUseCase
}

public extension ScheduleServiceDependency {

    static func resolve() -> ScheduleServiceDependency {
        let localDataSource: LocalScheduleDataSource = LocalScheduleDataSourceImpl()
        let remoteDataSource: RemoteScheduleDataSource = RemoteScheduleDataSourceImpl()

        let repository: ScheduleRepository = ScheduleRepositoryImpl(
            localDataSource: localDataSource,
            remoteDataSource: remoteDataSource
        )

        let fetchScheduleForMonthUseCase = FetchSchedulePerMonthUseCase(
            repository: repository
        )
        let createScheduleUseCase = CreateScheduleUseCase(
            repository: repository
        )
        let editScheduleUseCase = EditScheduleUseCase(
            repository: repository
        )
        let deleteScheduleUseCase = DeleteScheduleUseCase(
            repository: repository
        )

        return ScheduleServiceDependency(
            fetchScheduleForMonthUseCase: fetchScheduleForMonthUseCase,
            createScheduleUseCase: createScheduleUseCase,
            editScheduleUseCase: editScheduleUseCase,
            deleteScheduleUseCase: deleteScheduleUseCase
        )
    }
}
