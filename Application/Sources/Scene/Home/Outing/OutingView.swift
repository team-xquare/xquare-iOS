import SwiftUI

import MealDataService
import SemicolonDesign

struct OutingView: View {

    var outingPassView: OutingPassView
    var name: String
    var endTime: Date

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(name)님의 외출시간은")
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
                HStack(spacing: 0) {
                    Text(endTime.toString(format: "HH시 mm분"))
                        .sdText(type: .body3, textColor: .GrayScale.gray900)
                    Text("까지 입니다.")
                        .sdText(type: .body3, textColor: .GrayScale.gray900)
                }
            }
            Spacer()
            NavigationLink {
                outingPassView
            } label: {
                Text("외출증 확인하기")
                    .sdText(type: .body3, textColor: .GrayScale.gray0)
                    .padding(EdgeInsets(top: 14, leading: 12, bottom: 14, trailing: 12))
                    .background(Color.Primary.purple300)
                    .cornerRadius(12)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(Color.GrayScale.gray0)
        .cornerRadius(16)
    }
}
