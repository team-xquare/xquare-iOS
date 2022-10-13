import Foundation

import RxSwift
import MealDataService

class MealDetailViewModel: ObservableObject {
    @Published var menu: [MealMenuPerDayEntity] = []

    private let fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase

    init(fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase) {
        self.fetchMealMenuPerMonthUseCase = fetchMealMenuPerMonthUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchMealMenuPerMonth() {
        self.fetchMealMenuPerMonthUseCase.excute(date: Date())
            .subscribe(onNext: {
                self.menu = $0
            }).disposed(by: disposeBag)
    }
}
