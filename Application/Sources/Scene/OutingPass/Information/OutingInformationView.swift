import SwiftUI

import SemicolonDesign

struct OutingInformationView: View {

    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .sdText(type: .body3)
            HStack {
                Text(content)
                    .sdText(type: .body2)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 0))
            .background(Color.GrayScale.gray50)
            .cornerRadius(8)
        }
        .padding(.bottom, 20)
    }
}

struct OutingInformationView_Previews: PreviewProvider {
    static var previews: some View {
        OutingInformationView(
            title: "외출시간",
            content: "16:00"
        )
    }
}
