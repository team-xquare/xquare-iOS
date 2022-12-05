import SwiftUI

import SemicolonDesign

struct MyInformationView: View {
    let title: String
    let content: String

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text(title)
                .sdText(type: .body4, textColor: .GrayScale.gray900)
                .padding(.bottom, 8)
            HStack {
                Text(content)
                    .sdText(type: .body2, textColor: .GrayScale.gray800)
                Spacer()
            }
            .padding(.leading, 16)
            .frame(height: 44)
            .background(Color.GrayScale.gray50)
            .overlay { RoundedRectangle(cornerRadius: 8).stroke(Color.GrayScale.gray300) }
        }
        .padding(.bottom, 20)
    }
}

struct MyInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MyInformationView(
            title: "이름",
            content: "김기영"
        )
    }
}
