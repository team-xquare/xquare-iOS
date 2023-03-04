import Foundation

import RxSwift
import MealDataService

class MealDetailViewModel: ObservableObject {

    @Published var menu: [MealMenuPerDayEntity] = []
    @Published var dateToShowData: Int = 0

    private let fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase

    init(fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase) {
        self.fetchMealMenuPerMonthUseCase = fetchMealMenuPerMonthUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchMealMenuPerMonth() {
        self.fetchMealMenuPerMonthUseCase.excute(date: Date())
            .subscribe(onNext: { [weak self] in
                self?.menu = $0
                self?.dateToShowData = self?.calculateDateToShowData(allMenu: $0) ?? 0
            }).disposed(by: disposeBag)
    }

    private func calculateDateToShowData(allMenu: [MealMenuPerDayEntity]) -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return allMenu.firstIndex(where: { $0.date >= today.toString(format: "M월 d일 (E)") }) ?? 0
    }

}
