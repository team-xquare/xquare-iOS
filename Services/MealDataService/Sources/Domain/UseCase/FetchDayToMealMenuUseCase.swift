import Foundation

import RxSwift

public class FetchDayToMealMenuUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func excute(date: Date) -> Single<DayToMealMenuEntity> {
        return mealRepository.fetchDayToMealMenu(date: date.toString())
    }
}
