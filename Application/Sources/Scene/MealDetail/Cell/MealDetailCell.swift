import SwiftUI

import SemicolonDesign
import MealDataService

struct MealDetailCell: View {
    var entity: MealMenuPerDayEntity

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                Text(entity.date)
                    .sdText(type: .body1, textColor: .GrayScale.gray900)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                ForEach(entity.menu, id: \.mealTime) {
                    if $0.menu != [] {
                        MealMenuPerMealTimeView(
                            entity: $0
                        )
                        .padding(.bottom, 8)
                    }
                }
            }
            Spacer()
        }
        .padding(.vertical, 16)
        .background(Color.GrayScale.gray50)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: entity.date == Date().toString(format: "M월 d일 (E)") ? 1 : 0)
                .foregroundColor(.Primary.purple100)
        )
        .padding(.horizontal, 16)
    }
}
