import Foundation

import RxSwift

public class FetchDayToMealMenuUseCase {

    private let mealRepository: MealRepository

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func excute(date: String) -> Observable<DayToMealMenuEntity> {
        return mealRepository.fetchDayToMealMenu(date: date)
    }
}
