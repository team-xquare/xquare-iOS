import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuView: View {

    var mealDetailView: MealDetailView
    var menu: [MealMenuEntity]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 16)
            HStack {
                Spacer().frame(width: 12)
                Text("오늘의 메뉴").sdText(type: .body1)
                Spacer()
                NavigationLink {
                    mealDetailView
                } label: {
                    Image(systemName: "square.fill")
                        .font(.system(size: 24))
                        .tint(.GrayScale.gray200)
                }
                Spacer().frame(width: 16)
            }
            Spacer().frame(height: 14)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    Spacer().frame(width: 8)
                    ForEach(menu, id: \.mealTime) {
                        MealListCell(
                            mealTime: $0.mealTime.rawValue,
                            menu: $0.menu ?? ["등록된 급식 정보가 없어요."]
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
