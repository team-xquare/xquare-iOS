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
                    Text(getTimeForSend(date: entity.sendAt))
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

    private func getTimeForSend(date: Date) -> String {
        let today = Date()

        if Int(today.toString(format: "MM")) ?? 0 > Int(date.toString(format: "MM")) ?? 0 {
            return "\((Int(today.toString(format: "MM")) ?? 0) - (Int(date.toString(format: "MM")) ?? 0))달 전"
        } else if Int(today.toString(format: "dd")) ?? 0 > Int(date.toString(format: "dd")) ?? 0 {
            return "\((Int(today.toString(format: "dd")) ?? 0) - (Int(date.toString(format: "dd")) ?? 0))일 전"
        } else if Int(today.toString(format: "HH")) ?? 0 > Int(date.toString(format: "HH")) ?? 0 {
            return "\((Int(today.toString(format: "HH")) ?? 0) - (Int(date.toString(format: "HH")) ?? 0))시간 전"
        } else if Int(today.toString(format: "mm")) ?? 0 > Int(date.toString(format: "mm")) ?? 0 {
            return "\((Int(today.toString(format: "mm")) ?? 0) - (Int(date.toString(format: "mm")) ?? 0))분 전"
        } else {
            return "방금 전"
        }
    }
    // swiftlint:disable line_length
    private func topicToImage(topic: NotificationTopic) -> Image {
        switch topic {
        case .applicationWeekendMeal, .applicationStay, .applicationMoveClassRoom, .applicationPicnic, .applicationPicnicPass, .applicationWeekendPicnic, .applicationWeekendPicnicReservation:
            return Image.application
        case .allGoodPoint:
            return Image.thumbUpNotiIcon
        case .allBadPoint, .allPenaltyLevel:
            return Image.thumbDownNotiIcon
        case .scheduleLocal, .scheduleSocial:
            return Image.calendar
        case .feedNotice, .feedBambooLike, .feedNoticeLike, .feedBambooComment, .feedNoticeComment:
            return Image.feed
        }
    }
    // swiftlint:enable line_length
}
