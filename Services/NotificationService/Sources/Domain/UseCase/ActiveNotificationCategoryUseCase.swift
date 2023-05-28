import Foundation

import RxSwift

public class ActiveNotificationCategoryUseCase {

    private let repositry: NotificationRepository

    init(repositry: NotificationRepository) {
        self.repositry = repositry
    }

    public func excute(topic: NotificationActivateTopic, isActivated: Bool) -> Completable {
        return repositry.activeNotificationCategory(topic: topic, isActivated: isActivated)
    }

}
