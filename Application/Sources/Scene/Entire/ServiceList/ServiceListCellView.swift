import SwiftUI

import SemicolonDesign

struct ServiceListCellView: View {

    @EnvironmentObject var xquareRouter: XquareRouter
    var text: String
    var view: XquareRoute

    var body: some View {
        Button {
            xquareRouter.navigateTo(view)
        } label: {
            HStack {
                Text(text)
                    .sdText(type: .body2, textColor: .GrayScale.gray900)
                Spacer()
            }
            .padding([.vertical, .leading], 16)
            .background(Color.GrayScale.gray50)
            .cornerRadius(12)
        }
    }
}
