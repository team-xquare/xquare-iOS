import Foundation

public struct MealDataServiceDependency {
    public let fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase
    public let fetchMonthToMealMenuUseCase: FetchMonthToMealMenuUseCase
}

public extension MealDataServiceDependency {
    static func resolve() -> MealDataServiceDependency {
        let remoteDataSource: RemoteMealDataSource = RemoteMealDataSourceImpl()

        let mealRepository: MealRepository = MealRepositoryImpl(
            remoteDataSource: remoteDataSource
        )

        let fetchDayToMealMenuUseCase = FetchDayToMealMenuUseCase(
            mealRepository: mealRepository
        )
        let fetchMonthToMealMenuUseCase = FetchMonthToMealMenuUseCase(
            mealRepository: mealRepository
        )

        return MealDataServiceDependency(
            fetchDayToMealMenuUseCase: fetchDayToMealMenuUseCase,
            fetchMonthToMealMenuUseCase: fetchMonthToMealMenuUseCase
        )
    }
}
