import SwiftUI

import SemicolonDesign

struct ServiceListCellButtonView: View {

    var text: String
    var action: () -> Void
    var textColor: Color

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .sdText(type: .body2, textColor: textColor)
                Spacer()
            }
            .padding([.vertical, .leading], 16)
            .background(Color.GrayScale.gray50)
            .cornerRadius(12)
        }
    }
}
