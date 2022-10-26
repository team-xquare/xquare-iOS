import SwiftUI

import MealDataService
import UserService
import RxSwift

class HomeViewModel: ObservableObject {

    private var disposeBag = DisposeBag()

    @Published var imageUrl: String = ""
    @Published var name: String = ""
    @Published var merit: Int = 0
    @Published var demerit: Int = 0
    @Published var menu: [MealMenuEntity] = []

    private let fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase
    private let fetchUserPointUseCase: FetchUserSimpleInformationUseCase

    init(
        fetchMealMenuPerDayUseCase: FetchMealMenuPerDayUseCase,
        fetchUserPointUseCase: FetchUserSimpleInformationUseCase
    ) {
        self.fetchMealMenuPerDayUseCase = fetchMealMenuPerDayUseCase
        self.fetchUserPointUseCase = fetchUserPointUseCase
    }

    func fetchTodaysMeal() {
        self.fetchMealMenuPerDayUseCase.excute(date: Date())
            .subscribe(onNext: {
                self.menu = $0.menu
            })
            .disposed(by: disposeBag)
    }

    func fetchUserPoint() {
        self.fetchUserPointUseCase.excute()
            .asObservable()
            .subscribe(onNext: {
                self.name = $0.name
                self.imageUrl = $0.profileFileName
                self.merit = $0.goodPoint
                self.demerit = $0.badPoint
            }).disposed(by: disposeBag)
    }

}
