import SwiftUI
import SemicolonDesign

struct MealListCell: View {

    var mealTime: String
    var menu: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(mealTime).sdText(type: .body2)
            Spacer().frame(height: 8)
            ForEach(menu, id: \.self) { menu in
                Text(menu).sdText(type: .body4)
                Spacer().frame(height: 0)
            }
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
        MealListCell(mealTime: "아침", menu: ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"])
    }
}
