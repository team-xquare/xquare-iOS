import SwiftUI

struct ServiceSectionView<Destination>: View where Destination: View {

    var headerText: String
    var services: [(text: String, destination: Destination)]

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(headerText)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            ForEach(services, id: \.text) { service in
                ServiceListCellView(text: service.text) {
                    service.destination
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
