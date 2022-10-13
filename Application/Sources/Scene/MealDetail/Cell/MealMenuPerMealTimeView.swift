import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuPerMealTimeView: View {
    var mealTime: MealTime
    var menu: [String]
    var kcal: String

    init(mealTime: MealTime, menu: [String], kcal: String = "") {
        self.mealTime = mealTime
        self.menu = menu
        self.kcal = self.menu.removeLast()
    }

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            HStack(spacing: 8) {
                Text(mealTime.toString())
                    .sdText(
                        type: .body2,
                        textColor: .GrayScale.gray800
                    )
                Text(kcal)
                    .sdText(type: .body2)
            }
            Text(menu.joined(separator: ", "))
                .sdText(type: .body2)
        }
        .padding(.leading, 16)
    }
}

struct MealMenuPerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MealMenuPerMealTimeView(
            mealTime: .breakfast,
            menu: ["밥", "국", "찌개"]
        )
    }
}
