import SwiftUI

import SemicolonDesign
import MealDataService

struct MealDetailCell: View {
    var entity: MealMenuPerDayEntity

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Text(entity.date.toString(format: "M월 d일 (E)"))
                    .sdText(type: .body1)
                    .padding(.leading, 16)
                ForEach(entity.menu, id: \.mealTime) {
                    MealMenuPerMealTimeView(
                        mealTime: $0.mealTime,
                        kcal: 10.0,
                        menu: $0.menu ?? []
                    )
                }
            }
            Spacer()
        }
        .padding(.vertical, 16)
        .background(Color.GrayScale.gray50)
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}

struct MealDetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailCell(entity: .init(
            date: Date(),
            menu: [
                .init(mealTime: .breakfast, menu: ["밥"]),
                .init(mealTime: .lunch, menu: ["밥"]),
                .init(mealTime: .dinner, menu: ["밥"])
            ]))
    }
}