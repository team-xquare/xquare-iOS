import Foundation

import RxSwift
import MealDataService

class MealDetailViewModel: ObservableObject {

    @Published var menu: [MealMenuPerDayEntity] = []
    @Published var dateToShowData: Date = Date()

    private let fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase

    init(fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase) {
        self.fetchMealMenuPerMonthUseCase = fetchMealMenuPerMonthUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchMealMenuPerMonth() {
        self.fetchMealMenuPerMonthUseCase.excute(date: Date())
            .subscribe(onNext: { [weak self] in
                self?.menu = $0
                self?.dateToShowData = self?.calculateDateToShowData(allMenu: $0) ?? Date()
            }).disposed(by: disposeBag)
    }

    private func calculateDateToShowData(allMenu: [MealMenuPerDayEntity]) -> Date? {
        let today = Calendar.current.startOfDay(for: Date())
        return allMenu.first(where: { $0.date >= today })?.date ?? allMenu.last?.date
    }

}
