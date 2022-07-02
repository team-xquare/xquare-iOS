import SwiftUI
import SemicolonDesign

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.GrayScale.gray50.ignoresSafeArea()
            VStack(spacing: 16) {
                HStack {
                    Spacer()
                        .frame(width: 16)
                    HStack(spacing: 12) {
                        Spacer()
                            .frame(width: 16)
                        Image(systemName: "clock")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .cornerRadius(22)
                        VStack(alignment: .leading, spacing: 0) {
                            SDText("수준호", type: .body1, textColor: Color.GrayScale.gray900)
                            SDText("벌점 1점 상점 20점", type: .body2, textColor: Color.GrayScale.gray700)
                        }
                        Spacer()
                    }.frame(height: 76)
                        .background(Color.GrayScale.gray0)
                        .cornerRadius(16)
                    Spacer()
                        .frame(width: 16)
                }
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
                                SDText("오늘의 메뉴", type: .body1, textColor: Color.GrayScale.gray900)
                            }
                            HStack {
                                Spacer()
                                    .frame(width: 16)
                                ScrollView(.horizontal) {
                                    HStack(spacing: 8) {
                                        ForEach(0..<3) { num in
                                            MealListCell(
                                                mealTime: num,
                                                menu: ["치킨텐더/머스타드", "훈제황금린", "수리취찰떡", "시리얼/우유", "배동동식혜"])
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
