import SwiftUI

struct ServiceSectionView: View {

    var headerText: String
    var services: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(headerText)
                .sdText(type: .body1, textColor: .GrayScale.gray900)
            ForEach(services, id: \.self) { service in
                ServiceListCellView(text: service) {
                    Text(service)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
