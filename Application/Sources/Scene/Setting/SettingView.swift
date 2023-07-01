import SwiftUI
import SemicolonDesign

struct SettingView: View {

    @StateObject var viewModel: SettingViewModel
    @EnvironmentObject var xquareRouter: XquareRouter

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Spacer().frame(height: 16)
                AlarmSettingView(
                    isFeedToggle: $viewModel.isFeedToggle,
                    isApplicationToggle: $viewModel.isApplicationToggle,
                    isAllToggle: $viewModel.isAllToggle,
                    isScheduleToggle: $viewModel.isScheduleToggle
                )
                Rectangle().frame(height: 12)
                    .foregroundColor(Color.GrayScale.gray50)
                    .padding(.vertical, 8)
                AccountSettingView(
                    services: [
                        ("회원탈퇴", "XQUARE에서 계정이 영구적으로 삭제되어요.", { viewModel.showQuitAlert = true }, .System.red400)
                    ]
                )
                .sdAlert(isPresented: $viewModel.showQuitAlert) {
                    SDAlert(
                        title: "정말 회원탈퇴 하시겠습니까?",
                        button1: (text: "아니요", action: { }),
                        button2: (text: "네", action: {
                            viewModel.logout()
                            self.xquareRouter.popToRoot()
                        })
                    )
                }
                Spacer()
            }
        }
        .navigationTitle("설정")
        .navigationBarTitleDisplayMode(.inline)
        .setNavigationBackButtonWithRouter()
        .navigationBarBackButtonHidden()
        .onAppear(perform: viewModel.fetchActivatedCategoryList)
        .onDisappear(perform: viewModel.activeNotificationCategory)
    }
}
