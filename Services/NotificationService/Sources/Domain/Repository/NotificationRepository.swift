import Foundation

import RxSwift

protocol NotificationRepository {
    func fetchNotificationCategoryList(defaultActivated: Bool) -> Observable<[CategoryEntity]>
    func fetchActivatedNotificationCategoryList() -> Observable<[CategoryEntity]>
    func activeNotificationCategory(topic: String, isActivated: Bool) -> Completable
    func fetchPostedNotificationList() -> Observable<[NotificationEntity]>
    func checkNotification(notificationId: String) -> Completable
    func fetchUncheckNotificationCount() -> Observable<Int>
}
