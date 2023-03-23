import SwiftUI

import XDateUtil

struct NotificationView: View {
    @StateObject var viewModel: NotificationViewModel

    var body: some View {
        VStack(spacing: 0) {
            List(viewModel.notifications, id: \.id) {
                NotificationListCell(
                    entity: $0
                )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
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
