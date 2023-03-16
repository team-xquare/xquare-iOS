import Foundation

import RxSwift

public class CheckNotificationUseCase {

    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    public func excute(notificationId: String) -> Completable {
        return repository.checkNotification(notificationId: notificationId)
    }

}
