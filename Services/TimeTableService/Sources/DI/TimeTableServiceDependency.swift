import Foundation

public struct TimeTableServiceDependency {
    public static let shared = Self.resolve()

    public let fetchTimeTableForWeekUseCase: FetchTimeTableForWeekUseCase
}

extension TimeTableServiceDependency {

    static func resolve() -> TimeTableServiceDependency {

        let remoteDataSource = RemoteTimeTableDataSourceImpl()

        let repository = TimeTableRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        let fetchTimeTableForWeekUseCase = FetchTimeTableForWeekUseCase(
            repository: repository
        )

        return .init(fetchTimeTableForWeekUseCase: fetchTimeTableForWeekUseCase)
    }

}
