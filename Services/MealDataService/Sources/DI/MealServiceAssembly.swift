import Foundation

import Swinject

public class MealServiceAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        registerDataSource(container: container)
        registerRepository(container: container)
        registerUseCase(container: container)
    }
}

extension MealServiceAssembly {

    private func registerDataSource(container: Container) {
        container.register(RemoteDataSource.self) { _ in RemoteMealDataSourceImpl() }
    }

    private func registerRepository(container: Container) {
        container.register(MealRepository.self) { resolver in
            MealRepositoryImpl(
                remoteDataSource: resolver.resolve(RemoteDataSource.self)!
            )
        }
    }

    private func registerUseCase(container: Container) {
        container.register(FetchDayToMealMenuUseCase.self) { resolver in
            FetchDayToMealMenuUseCase(
                mealRepository: resolver.resolve(MealRepository.self)!
            )
        }
        container.register(FetchMonthToMealMenuUseCase.self) { resolver in
            FetchMonthToMealMenuUseCase(
                mealRepository: resolver.resolve(MealRepository.self)!
            )
        }
    }
}
