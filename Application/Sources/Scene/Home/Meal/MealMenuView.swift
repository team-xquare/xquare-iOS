import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuView: View {

    @State var menu: [MealTime: [String]]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 16)
            HStack {
                Spacer().frame(width: 12)
                Text("오늘의 메뉴").sdText(type: .body1)
                Spacer()
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "square.fill")
                        .font(.system(size: 24))
                        .tint(.GrayScale.gray200)
                })
                Spacer().frame(width: 16)
            }
            Spacer().frame(height: 14)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Spacer().frame(width: 8)
                    ForEach(
                        Array(menu).sorted {
                            return $0.key.mealTimeOrder < $1.key.mealTimeOrder
                        },
                        id: \.key
                    ) { menu in
                        MealListCell(
                            mealTime: menu.key.rawValue,
                            menu: menu.value
                        )
                    }
                    Spacer().frame(width: 8)
                }
            }
            Spacer().frame(height: 16)
        }
        .background(Color.GrayScale.gray0)
        .cornerRadius(16)
    }

}

struct MealMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MealMenuView(menu: [
                .breakfast: ["치킨텐더"],
                .lunch: ["치킨텐더"],
                .dinner: ["치킨텐더"]
            ])
                .previewLayout(.sizeThatFits)
        }
    }
}
