import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(spacing: 0) {
            List(0..<10, id: \.self) { _ in
                NotificationListCell(
                    image: .init(systemName: "checkmark.circle"),
                    category: "주말급식 신청",
                    content: "12월 주말 급식 신청이 곧 ㄹ아야아야러ㅇㄴㄹㄴㅇㄹ 마갑됩니다.",
                    time: "1시간 전"
                )
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
        }
        .navigationTitle("알림")
        .navigationBarTitleDisplayMode(.inline)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
    }
}
