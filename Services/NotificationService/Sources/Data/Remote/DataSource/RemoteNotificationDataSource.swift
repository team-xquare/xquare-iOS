import Foundation

import RxSwift
import RestApiModule

protocol RemoteNotificationDataSource: RestApiRemoteDataSource<NotificationAPI> {
    func fetchNotificationCategoryList(defaultActivated: Bool) -> Single<[CategoryEntity]>
    func fetchActivatedNotificationCategoryList() -> Single<[CategoryEntity]>
    func activeNotificationCategory(categoryId: String) -> Completable
    func inactiveNotificationCategory(categoryId: String) -> Completable
    func fetchPostedNotificationList() -> Single<[NotificationEntity]>
    func checkNotification(notificationId: String) -> Completable
    func fetchUncheckNotificationCount() -> Single<Int>
}
