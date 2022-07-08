import Foundation

import RxSwift

public class FetchMonthToMealMenuUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func excute(
        year: String,
        month: String
    ) -> Single<[MonthToMealMenuEntity]> {
        return mealRepository.fetchMonthtoMealMenu(
            year: year,
            month: month
        )
    }
}
