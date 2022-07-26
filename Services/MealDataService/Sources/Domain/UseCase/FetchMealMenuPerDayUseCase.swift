import Foundation

import RxSwift

public class FetchMealMenuPerDayUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    public func excute(date: Date) -> Single<MealMenuPerDayEntity> {
        return mealRepository.fetchMealMenuPerDay(date: date.toString(format: .fullDate))
    }
}
