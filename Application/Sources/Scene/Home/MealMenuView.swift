import SwiftUI

import SemicolonDesign

struct MealMenuView: View {
    @State var menu: [String]
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                        .frame(height: 16)
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        SDText("오늘의 메뉴", type: .body1)
                    }
                    HStack {
                        Spacer()
                            .frame(width: 16)
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                ForEach(0..<3) { num in
                                    MealListCell(
                                        mealTime: num,
                                        menu: menu)
                                }
                            }
                        }
                    }
                    Spacer().frame(height: 16)
                }
                Spacer()
            }
            .background(Color.GrayScale.gray0)
            .cornerRadius(16)
            Spacer()
                .frame(width: 16)
        }
    }
}

struct MealMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MealMenuView(menu: ["치킨텐더"])
    }
}
