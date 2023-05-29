import Foundation

import RxSwift
import RestApiModule

protocol RemoteNotificationDataSource: RestApiRemoteDataSource<NotificationAPI> {
    func fetchNotificationCategoryList(defaultActivated: Bool) -> Single<[CategoryEntity]>
    func fetchActivatedNotificationCategoryList() -> Single<[CategoryEntity]>
    func activeNotificationCategory(topic: NotificationActivateTopic, isActivated: Bool) -> Completable
    func fetchPostedNotificationList() -> Single<[NotificationEntity]>
    func checkNotification(notificationId: String) -> Completable
    func fetchUncheckNotificationCount() -> Single<Int>
}
