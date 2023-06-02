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
            var resultMinute = calculateToMinute(date: today) - calculateToMinute(date: date)
            if resultMinute / 60 == 0 && resultMinute % 60 == 0 {
                return "방금 전"
            } else if resultMinute / 60 == 0 {
                return "\(resultMinute % 60)분 전"
            } else if resultMinute / 60 / 24 == 0 {
                return "\(resultMinute / 60 % 24)시간 전"
            } else if resultMinute / 60 / 24 / 30 == 0 {
                return "\(resultMinute / 60 / 24 % 30)일 전"
            } else {
                return "\(resultMinute / 60 / 24 / 30)달 전"
            }
        }
        private func calculateToMinute(date: Date) -> Int {
            let dateList = date.toString(format: "MM:dd:HH:mm").split(separator: ":").map { Int($0)! }
            return dateList[0] * 30 * 24 * 60 * 1 + dateList[1] * 24 * 60 * 1 + dateList[2] * 60 * 1 + dateList[3]
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
        case .feedNotice, .feedComment, .feedLike:
            return Image.feed
        }
    }
    // swiftlint:enable line_length
}
