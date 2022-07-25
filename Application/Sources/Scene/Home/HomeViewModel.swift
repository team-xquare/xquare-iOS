import SwiftUI

import MealDataService
import RxSwift

class HomeViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var name: String = "수준호"
    @Published var merit: Int = 1
    @Published var demerit: Int = 2
    @Published var breakfast: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
    @Published var lunch: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
    @Published var dinner: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]

    private let fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase

    init(
        fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase
    ) {
        self.fetchDayToMealMenuUseCase = fetchDayToMealMenuUseCase
    }

    private var day = Date()
    private var disposeBag = DisposeBag()

    func fetchDayToMealMenu() {
        self.fetchDayToMealMenuUseCase.excute(date: day)
            .asObservable()
            .subscribe(onNext: {
                self.breakfast = $0.breakfast
                self.lunch = $0.lunch
                self.dinner = $0.dinner
            }).disposed(by: disposeBag)
    }
}
