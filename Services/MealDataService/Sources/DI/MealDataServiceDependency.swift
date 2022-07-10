import Foundation

import AuthService

public struct MealDataServiceDependency {
    public let fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase
    public let fetchMonthToMealMenuUseCase: FetchMonthToMealMenuUseCase
}

public extension MealDataServiceDependency {
    static func resolve() -> MealDataServiceDependency {

        let authServiceDpendency = AuthServiceDependency.resolve()

        let remoteDataSource: RemoteMealDataSource = RemoteMealDataSourceImpl(
            checkIsTokenValidUseCase: authServiceDpendency.checkIsTokenValidUseCase,
            refreshTokenUseCase: authServiceDpendency.refreshTokenUseCase,
            jwtPlugin: authServiceDpendency.jwtPlugin
        )

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
