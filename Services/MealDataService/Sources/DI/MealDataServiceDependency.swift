import Foundation

public struct MealDataServiceDependency {

    public static let shared = Self.resolve()

    public let fetchDayToMealMenuUseCase: FetchMealMenuPerDayUseCase
    public let fetchMonthToMealMenuUseCase: FetchMealMenuPerMonthUseCase

}

extension MealDataServiceDependency {
    static func resolve() -> MealDataServiceDependency {

        let localDataSource = LocalMealDataSourceImpl()

        let remoteDataSource: RemoteMealDataSource = RemoteMealDataSourceImpl()

        let mealRepository: MealRepository = MealRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )

        let fetchDayToMealMenuUseCase = FetchMealMenuPerDayUseCase(
            mealRepository: mealRepository
        )
        let fetchMonthToMealMenuUseCase = FetchMealMenuPerMonthUseCase(
            mealRepository: mealRepository
        )

        return MealDataServiceDependency(
            fetchDayToMealMenuUseCase: fetchDayToMealMenuUseCase,
            fetchMonthToMealMenuUseCase: fetchMonthToMealMenuUseCase
        )
    }
}
