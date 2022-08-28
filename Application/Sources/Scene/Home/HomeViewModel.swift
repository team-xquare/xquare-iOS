import SwiftUI

import MealDataService
import RxSwift

class HomeViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var imageUrl: String = ""
    @Published var name: String = ""
    @Published var merit: Int = 0
    @Published var demerit: Int = 0
    @Published var menu: [MealMenuEntity] = []

    private let fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase

    init(fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase) {
        self.fetchMealMenuPerDayUseCase = fetchMealMenuPerDayUseCase
    }

    func fetchTodaysMeal() {
        self.fetchMealMenuPerDayUseCase.excute(date: Date())
            .subscribe(onNext: {
                self.menu = $0.menu
            })
            .disposed(by: disposeBag)
    }

}
