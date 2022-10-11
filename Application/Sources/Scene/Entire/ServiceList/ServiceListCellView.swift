import SwiftUI

import SemicolonDesign

struct ServiceListCellView<Destination>: View where Destination: View {

    var text: String
    var destination: () -> Destination

    var body: some View {
        NavigationLink(destination: destination) {
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
