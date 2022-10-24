import SwiftUI

import MealDataService
import SemicolonDesign

struct MealListCell: View {

    var entity: MealMenuEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(entity.mealTime.toString())
                .sdText(type: .body2)
            Spacer().frame(height: 8)
            ForEach(
                entity.menu ?? ["등록된 정보가 없습니다."],
                id: \.self
            ) { menu in
                Text(menu).sdText(type: .body4)
                Spacer().frame(height: 0)
            }
            Text(entity.kcal ?? "").sdText(type: .body4)
            Spacer()
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
        .frame(width: 148, height: 198, alignment: .leading)
        .background(Color.GrayScale.gray50)
        .cornerRadius(8)
    }
}

struct MealListCell_Previews: PreviewProvider {
    static var previews: some View {
        MealListCell(entity: .init(
            mealTime: .breakfast,
            menu: ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"],
            kcal: "123 kcal"))
    }
}
