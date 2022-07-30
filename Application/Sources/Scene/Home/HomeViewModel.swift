import SwiftUI

import MealDataService
import RxSwift

class HomeViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var name: String = "수준호"
    @Published var merit: Int = 1
    @Published var demerit: Int = 2
    @Published var menu: [MealMenuEntity] = [.init(mealTime: .breakfast, menu: ["치킨텐더"]),
                                             .init(mealTime: .lunch, menu: ["치킨텐더"]),
                                             .init(mealTime: .dinner, menu: ["치킨텐더"])]
    private let fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase

    init(
        fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase
    ) {
        self.fetchMealMenuPerDayUseCase = fetchMealMenuPerDayUseCase
    }

    private var date = Date()
    private var disposeBag = DisposeBag()

    func fetchDayToMealMenu() {
        self.fetchMealMenuPerDayUseCase.excute(date: date)
            .asObservable()
            .subscribe(onNext: {
                self.menu = $0.menu
            }).disposed(by: disposeBag)
    }
}
