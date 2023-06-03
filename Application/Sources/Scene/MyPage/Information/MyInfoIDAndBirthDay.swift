import SwiftUI

import SemicolonDesign

struct MyInfoIDAndBirthDay: View {
    var id: String
    var birthDay: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("아이디: \(id)")
                .sdText(type: .caption2, textColor: .GrayScale.gray800)
            Text("생년월일: \(birthDay)")
                .sdText(type: .caption2, textColor: .GrayScale.gray800)
        }
        .padding([.leading, .bottom], 16)
    }
}

struct MyInfoIDAndBurthDay_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoIDAndBirthDay(id: "hello", birthDay: "2023년 6월 1일")
    }
}
