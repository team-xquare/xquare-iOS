import SwiftUI

import NotificationService
import SemicolonDesign
import XDateUtil

struct NotificationListCell: View {
    let entity: NotificationEntity

    var body: some View {
        HStack(alignment: .top, spacing: 0) {

            topicToImage(topic: entity.topic)
                .frame(width: 24, height: 24)
                .padding(.trailing, 4)
                .foregroundColor(entity.isRead ? .GrayScale.gray700 : .Primary.purple400)

            VStack(alignment: .leading, spacing: 0) {

                HStack(spacing: 4) {
                    Text(entity.categoryName)
                        .sdText(type: .caption)

                    Spacer()

                    Text(getTimeForSend(date: entity.sendAt))
                        .sdText(type: .caption)
                }
                Text(entity.content)
                    .sdText(type: .body3, textColor: .GrayScale.gray900)
            }
            .padding(.top, 2)

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
        } else {
            return "\((Int(today.toString(format: "mm")) ?? 0) - (Int(date.toString(format: "mm")) ?? 0))분 전"
        }
    }
    private func topicToImage(topic: NotificationTopic) -> Image {
        switch topic {
        case .feed:
            return .feed
        case .application:
            return .application
        case .schedule:
            return .calendar
        default:
            return Image.entire
        }
    }
}
