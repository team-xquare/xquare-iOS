import SwiftUI

import XDateUtil

struct NotificationView: View {
    @StateObject var viewModel: NotificationViewModel

    var body: some View {
        VStack(spacing: 0) {
            List(viewModel.notifications, id: \.id) {
                NotificationListCell(
                    image: .init(systemName: "checkmark.circle"),
                    category: $0.name,
                    content: $0.title,
                    time: $0.sendAt.toString(format: "HH")
                )
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
        }
        .onAppear(perform: viewModel.fetchNotification)
        .navigationTitle("알림")
        .navigationBarTitleDisplayMode(.inline)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
    }
}
