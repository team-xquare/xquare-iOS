import SwiftUI
import MealDataService

class HomeViewModel: ObservableObject {
    private let mealRepository: MealRepository
    @Published var imageUrl: String = ""
    @Published var name: String = "수준호"
    @Published var merit: Int = 1
    @Published var demerit: Int = 2
    @Published var menu: [String] = ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"]

    init(mealRepository: MealRepository) {
        self.mealRepository = mealRepository
    }

    func fetchDayToMealMenu() {
        let toDay = Date()

        mealRepository.fetchDayToMealMenu(date: toDay.toString(format: .fullDate))
            .map {
                
            }
    }
}
