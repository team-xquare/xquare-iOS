import Foundation

import RxSwift

public class FetchMonthToMealMenuUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    public func excute(
        request: MonthToMealMenuRequestEntity
    ) -> Single<[MonthToMealMenuEntity]> {
        return mealRepository.fetchMonthtoMealMenu(
            request: request
        )
    }
}
