import SwiftUI

import SemicolonDesign

struct AlarmSettingView: View {

    @Binding var isFeedToggle: Bool
    @Binding var isApplicationToggle: Bool
    @Binding var isAllToggle: Bool
    @Binding var isScheduleToggle: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SettingTitleView(
                title: "알림",
                subTitle: "공지사항 알림을 제외한 알림을 끌 수 있어요."
            )
            ToggleView(
                title: "피드",
                subTitle: "댓글 또는 좋아요가 달렸을 때 보내요.",
                isToggle: $isFeedToggle
            )
            ToggleView(
                title: "신청",
                subTitle: "급식, 외출 신청 등의 알림이에요.",
                isToggle: $isApplicationToggle
            )
            ToggleView(
                title: "상벌점",
                subTitle: "상점 또는 벌점에 변화가 있을 때 보내요.",
                isToggle: $isAllToggle
            )
            ToggleView(
                title: "일정",
                subTitle: "일정이 생길 때 보내요.",
                isToggle: $isScheduleToggle
            )
        }
    }
}
