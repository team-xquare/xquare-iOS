import SwiftUI
import SemicolonDesign

struct SettingView: View {

    @StateObject var viewModel: SettingViewModel

    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 16)
            HStack {
                Text("선택한 알림을 보내드릴게요.\n공지사항 알림은 꺼도 받을 수 있어요.")
                    .sdText(type: .body4, textColor: .GrayScale.gray400)
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer().frame(height: 20)
            ToggleView(
                title: "피드 알림",
                subTitle: "피드의 댓글과 좋아요 등의 알림을 설정해요",
                isToggle: $viewModel.isFeedToggle
            )
            ToggleView(
                title: "신청 알림",
                subTitle: "급식과 외출신청 등의 알림을 설정해요",
                isToggle: $viewModel.isApplicationToggle
            )
            ToggleView(
                title: "상벌점 알림",
                subTitle: "상벌점 등의 알림을 설정해요",
                isToggle: $viewModel.isAllToggle
            )
            ToggleView(
                title: "일정 알림",
                subTitle: "일정의 알림을 설정해요",
                isToggle: $viewModel.isScheduleToggle
            )
            Spacer()
        }
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .setNavigationBackButtonWithRouter()
        .navigationBarBackButtonHidden()
        .onAppear(perform: viewModel.fetchActivatedCategoryList)
        .onDisappear(perform: viewModel.activeNotificationCategory)
    }
}
