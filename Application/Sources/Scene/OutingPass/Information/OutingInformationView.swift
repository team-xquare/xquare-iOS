import SwiftUI

import SemicolonDesign

struct OutingInformationView: View {

    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .sdText(type: .body1)
            HStack {
                Text(content)
                    .sdText(type: .heading6)
                Spacer()
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
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
