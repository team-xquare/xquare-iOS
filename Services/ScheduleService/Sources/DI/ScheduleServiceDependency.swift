import Foundation

public struct ScheduleServiceDependency {
    public static let shared = Self.resolve()

    public let fetchScheduleForMonthUseCase: FetchScheduleForMonthUseCase
    public let createSchoolScheduleUseCase: CreateSchoolScheduleUseCase
    public let createScheduleUseCase: CreateScheduleUseCase
}

public extension ScheduleServiceDependency {

    static func resolve() -> ScheduleServiceDependency {

        let remoteDataSource: RemoteScheduleDataSource = RemoteScheduleDataSourceImpl()

        let repository: ScheduleRepository = ScheduleRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        let fetchScheduleForMonthUseCase = FetchScheduleForMonthUseCase(
            repository: repository
        )
        let createSchoolScheduleUseCase = CreateSchoolScheduleUseCase(
            repository: repository
        )
        let createScheduleUseCase = CreateScheduleUseCase(
            repository: repository
        )

        return ScheduleServiceDependency(
            fetchScheduleForMonthUseCase: fetchScheduleForMonthUseCase,
            createSchoolScheduleUseCase: createSchoolScheduleUseCase,
            createScheduleUseCase: createScheduleUseCase
        )
    }
}
