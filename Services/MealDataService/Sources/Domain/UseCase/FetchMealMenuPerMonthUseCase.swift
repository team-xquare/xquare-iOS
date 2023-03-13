import Foundation

import RxSwift

public class FetchMealMenuPerMonthUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    public func excute(date: Date) -> Observable<[MealMenuPerDayEntity]> {
        return mealRepository.fetchMealMenuPerMonth(date: date)
            .skip(1)
    }
}
