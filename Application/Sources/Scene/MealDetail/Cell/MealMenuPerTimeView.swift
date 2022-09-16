import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuPerTimeView: View {
    var mealTime: MealTime
    var kcal: Double
    var menu: [String]

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 6
        ) {
            HStack(spacing: 8) {
                Text(mealTimeToString(mealTime))
                    .sdText(
                        type: .body2,
                        textColor: .GrayScale.gray800
                    )
                Text(String(format: "%.1f kcal", kcal))
                    .sdText(type: .body2)
            }
            Text(menu.joined(separator: ", "))
                .sdText(type: .body2)
                .disabled(true)
        }
        .padding(.leading, 16)
    }

    private func mealTimeToString(_ mealTime: MealTime) -> String {
        switch mealTime {
        case .breakfast:
            return "아침"
        case .lunch:
            return "점심"
        case .dinner:
            return "저녁"
        }
    }
}

struct MealMenuPerTimeView_Previews: PreviewProvider {
    static var previews: some View {
        MealMenuPerTimeView(
            mealTime: .breakfast,
            kcal: 19.5,
            menu: ["밥", "국", "찌개"]
        )
    }
}
