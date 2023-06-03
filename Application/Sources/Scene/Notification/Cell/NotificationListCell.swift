import SwiftUI

import NotificationService
import SemicolonDesign
import XDateUtil

struct NotificationListCell: View {
    @EnvironmentObject var xquareRouter: XquareRouter
    let entity: NotificationEntity

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            topicToImage(topic: entity.topic)
                .frame(width: 24, height: 24)
                .padding(.trailing, 4)
                .foregroundColor(entity.isRead ? .GrayScale.gray700 : .Primary.purple400)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(entity.title)
                        .sdText(type: .caption2)

                    Spacer()
                    Text(entity.sendAt.getTimeAgoAsKoreanString())
                        .sdText(type: .caption2)
                }
                Text(entity.content)
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
            }
            .padding(.top, 3)

        }
        .padding(16)
        .background(entity.isRead ? .white : .GrayScale.gray50)
    }
    // swiftlint:disable line_length
    private func topicToImage(topic: NotificationTopic) -> Image {
        switch topic {
        case .applicationWeekendMeal, .applicationStay, .applicationMoveClassRoom, .applicationPicnic, .applicationPicnicPass, .applicationWeekendPicnic, .applicationWeekendPicnicReservation:
            return Image.application
        case .allGoodPoint, .feedBambooLike, .feedNoticeLike:
            return Image.thumbUpNotiIcon
        case .allBadPoint, .allPenaltyLevel:
            return Image.thumbDownNotiIcon
        case .scheduleLocal, .scheduleSocial:
            return Image.calendar
        case .feedNotice, .feedBambooComment, .feedNoticeComment:
            return Image.feed
        }
    }
    // swiftlint:enable line_length
}
