import SwiftUI
import MealDataService

class HomeViewModel: ObservableObject {
    private let fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase
    private let fetchMonthToMealMenuUseCase: FetchMonthToMealMenuUseCase
    let day = Date()
    @Published var imageUrl: String = ""
    @Published var name: String = "수준호"
    @Published var merit: Int = 1
    @Published var demerit: Int = 2
    @Published var breakfast: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
    @Published var lunch: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
    @Published var dinner: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]
    @Published var menu: [String] = []

    init(
        fetchDayToMealMenuUseCase: FetchDayToMealMenuUseCase,
        fetchMonthToMealMenuUseCase: FetchMonthToMealMenuUseCase
    ) {
        self.fetchDayToMealMenuUseCase = fetchDayToMealMenuUseCase
        self.fetchMonthToMealMenuUseCase = fetchMonthToMealMenuUseCase
    }

    func fetchDayToMealMenu() {
        self.fetchDayToMealMenuUseCase.r
    }
}
