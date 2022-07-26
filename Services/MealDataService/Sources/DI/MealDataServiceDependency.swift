import Foundation

import AuthService

public struct MealDataServiceDependency {
    public let fetchDayToMealMenuUseCase: FetchMealMenuPerDayUseCase
    public let fetchMonthToMealMenuUseCase: FetchMealMenuPerMonth
}

public extension MealDataServiceDependency {
    static func resolve() -> MealDataServiceDependency {

        let authServiceDpendency = AuthServiceDependency.resolve()
        let localDataSource = LocalDataSourceImpl()

        let remoteDataSource: RemoteMealDataSource = RemoteMealDataSourceImpl(
            checkIsTokenValidUseCase: authServiceDpendency.checkIsTokenValidUseCase,
            refreshTokenUseCase: authServiceDpendency.refreshTokenUseCase,
            jwtPlugin: authServiceDpendency.jwtPlugin
        )

        let mealRepository: MealRepository = MealRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )

        let fetchDayToMealMenuUseCase = FetchMealMenuPerDayUseCase(
            mealRepository: mealRepository
        )
        let fetchMonthToMealMenuUseCase = FetchMealMenuPerMonth(
            mealRepository: mealRepository
        )

        return MealDataServiceDependency(
            fetchDayToMealMenuUseCase: fetchDayToMealMenuUseCase,
            fetchMonthToMealMenuUseCase: fetchMonthToMealMenuUseCase
        )
    }
}
