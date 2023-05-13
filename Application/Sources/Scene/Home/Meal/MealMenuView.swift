import SwiftUI

import SemicolonDesign
import MealDataService

struct MealMenuView: View {

    @EnvironmentObject var xquareRouter: XquareRouter
    var menu: [MealMenuEntity]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 16)
            HStack {
                Spacer().frame(width: 12)
                Text("오늘의 메뉴").sdText(type: .body1)
                Spacer()
                Image.viewMoreIcon
                    .resizable()
                    .frame(width: 24, height: 24)
                    .tint(.GrayScale.gray200)
                Spacer().frame(width: 16)
            }
            Spacer().frame(height: 14)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(menu, id: \.mealTime) {
                        MealListCell(
                            entity: $0
                        )
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            Spacer().frame(height: 16)
        }
        .background(Color.GrayScale.gray0)
        .cornerRadius(16)
        .onTapGesture {
            self.xquareRouter.navigateTo(.mealDetail)
        }
    }

}
