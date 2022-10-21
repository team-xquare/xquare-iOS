import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuPerMealTimeView: View {
    var entity: MealMenuEntity

    var body: some View {
        if entity.menu != [] {
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                HStack(spacing: 8) {
                    Text(entity.mealTime.toString())
                        .sdText(
                            type: .body2,
                            textColor: .GrayScale.gray800
                        )
                    Text(entity.kcal)
                        .sdText(type: .body2)
                }
                Text(entity.menu?.joined(separator: ", ") ?? "")
                HStack(spacing: 8) {
                    Text(entity.mealTime.toString())
                        .sdText(
                            type: .body2,
                            textColor: .GrayScale.gray800
                        )
                    Text("\(entity.kcal)kcal")
                        .sdText(type: .body2)
                }
            }
            .padding(.leading, 16)
        }
    }
}

struct MealMenuPerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MealMenuPerMealTimeView(
            entity: .init(
                mealTime: .breakfast,
                menu: ["밥", "국", "찌개"],
                kcal: ""
            )
        )
    }
}
