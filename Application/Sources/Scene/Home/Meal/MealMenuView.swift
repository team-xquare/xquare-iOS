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
                    Image.viewMoreIcon
                        .resizable()
                        .frame(width: 24, height: 24)
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
                            entity: $0
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
