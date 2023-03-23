import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuPerMealTimeView: View {
    var entity: MealMenuEntity

    var body: some View {
        if entity.menu != nil {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                HStack(spacing: 8) {
                    Text(entity.mealTime.toString())
                        .sdText(
                            type: .body2,
                            textColor: .GrayScale.gray800
                        )
                    Text(entity.kcal ?? "")
                        .sdText(type: .body4)
                }
                .padding(.bottom, 4)
                Text(entity.menu?.joined(separator: ", ") ?? "")
                    .sdText(
                        type: .body4,
                        textColor: .GrayScale.gray900
                    )
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
                menu: ["dsf"],
                kcal: ""
            )
        )
    }
}
