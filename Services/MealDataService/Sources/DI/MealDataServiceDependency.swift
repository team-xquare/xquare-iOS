import Foundation

import AuthService

public struct MealDataServiceDependency {
    public let fetchDayToMealMenuUseCase: FetchMealMenuPerDayUseCase
    public let fetchMonthToMealMenuUseCase: FetchMealMenuPerMonthUseCase
}

public extension MealDataServiceDependency {
    static func resolve(authServiceDependency: AuthServiceDependency) -> MealDataServiceDependency {

        let localDataSource = LocalDataSourceImpl()

        let remoteDataSource: RemoteMealDataSource = RemoteMealDataSourceImpl(
            authServiceDependency: authServiceDependency
        )

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
