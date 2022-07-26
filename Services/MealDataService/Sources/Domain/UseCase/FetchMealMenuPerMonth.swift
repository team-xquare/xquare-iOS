import Foundation

import RxSwift

public class FetchMealMenuPerMonth {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    public func excute(
        date: Date
    ) -> Single<[[MealMenuEntity]]> {
        return mealRepository.fetchMealMenuPerMonth(
            date: date
        )
    }
}
