import SwiftUI
import SemicolonDesign

struct MealListCell: View {
    var mealTime: Int
    @State var menu: [String]
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 13)
            HStack {
                Spacer()
                    .frame(width: 16)
                VStack(alignment: .leading, spacing: 3) {
                    SDText(getMealTime(), type: .body1, textColor: .GrayScale.gray900)
                    Spacer()
                        .frame(height: 8)
                    ForEach(menu, id: \.self) { menu in
                        SDText(menu, type: .body2, textColor: .GrayScale.gray900)
                    }
                }
                Spacer()
                    .frame(width: 16)
            }
            Spacer()
        }.frame(width: 148, height: 198)
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
