import Foundation

import MealDataService

class MealDetailViewModel: ObservableObject {
    @Published var menu: [MealMenuPerDayEntity] = []
}
