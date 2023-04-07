import SwiftUI

struct ServiceSectionView: View {

    var headerText: String
    var services: [(text: String, view: XquareRoute)]

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(headerText)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            ForEach(services, id: \.text) { service in
                ServiceListCellView(text: service.text, view: service.view)
            }
        }
        .padding(.horizontal, 16)
    }
}
