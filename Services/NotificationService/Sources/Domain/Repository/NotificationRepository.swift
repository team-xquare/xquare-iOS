import Foundation

import RxSwift

protocol NotificationRepository {
    func fetchNotificationCategoryList(defaultActivated: Bool) -> Observable<[CategoryEntity]>
    func fetchActivatedNotificationCategoryList() -> Observable<[CategoryEntity]>
    func activeNotificationCategory(categoryId: String) -> Completable
    func inactiveNotificationCategory(categoryId: String) -> Completable
    func fetchPostedNotificationList() -> Observable<[NotificationEntity]>
    func checkNotification(notificationId: String) -> Completable
    func fetchUncheckNotificationCount() -> Observable<Int>
}
