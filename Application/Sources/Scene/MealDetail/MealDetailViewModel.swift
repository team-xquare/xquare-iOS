import Foundation

import RxSwift
import MealDataService

class MealDetailViewModel: ObservableObject {

    @Published var menu: [MealMenuPerDayEntity] = []
    @Published var dateToShowData: Int?

    private let fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase

    init(fetchMealMenuPerMonthUseCase: FetchMealMenuPerMonthUseCase) {
        self.fetchMealMenuPerMonthUseCase = fetchMealMenuPerMonthUseCase
    }

    private var disposeBag = DisposeBag()

    func fetchMealMenuPerMonth() {
        self.fetchMealMenuPerMonthUseCase.excute(date: Date())
            .subscribe(onNext: { [weak self] in
                self?.menu = $0
                self?.dateToShowData = self?.calculateDateToShowData(allMenu: $0)
            }).disposed(by: disposeBag)
    }

    private func calculateDateToShowData(allMenu: [MealMenuPerDayEntity]) -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return allMenu.firstIndex {
            let day = $0.date.split(separator: "월")[1].filter { Int(String($0)) != nil }
            return Int(String(day)) ?? 0 >= Int(today.toString(format: "d")) ?? 0
        } ?? 0
    }

}
