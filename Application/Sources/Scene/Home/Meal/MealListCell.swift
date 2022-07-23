import SwiftUI
import SemicolonDesign

struct MealListCell: View {

    var mealTime: Int
    @State var menu: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(getMealTime()).sdText(type: .body2)
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

    private func getMealTime() -> String {
        switch mealTime {
        case 0:
            return "아침"
        case 1:
            return "점심"
        case 2:
            return "저녁"
        default:
            return ""
        }
    }
}

struct MealListCell_Previews: PreviewProvider {
    static var previews: some View {
        MealListCell(mealTime: 0, menu: ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"])
    }
}
