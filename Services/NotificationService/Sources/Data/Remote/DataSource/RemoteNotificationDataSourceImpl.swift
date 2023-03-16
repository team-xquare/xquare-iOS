import Foundation

import RestApiModule
import RxSwift

class RemoteNotificationDataSourceImpl: RestApiRemoteDataSource<NotificationAPI>, RemoteNotificationDataSource {

    func fetchNotificationCategoryList(defaultActivated: Bool) -> Single<[CategoryEntity]> {
        return request(.fetchNotificationCategoryList(defaultActivated: defaultActivated))
            .map(CategoryListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchActivatedNotificationCategoryList() -> Single<[CategoryEntity]> {
        return request(.fetchActivatedNotificationCategoryList)
            .map(CategoryListResponse.self)
            .map { $0.toDomain() }
    }

    func activeNotificationCategory(categoryId: String) -> Completable {
        return request(.activeNotificationCategory(categoryId: categoryId))
            .asCompletable()
    }

    func inactiveNotificationCategory(categoryId: String) -> Completable {
        return request(.inactiveNotificationCategory(categoryId: categoryId))
            .asCompletable()
    }

    func fetchPostedNotificationList() -> Single<[NotificationEntity]> {
        return request(.fetchPostedNotificationList)
            .map(NotificationListResponse.self)
            .map { $0.toDomain() }
    }

    func checkNotification(notificationId: String) -> Completable {
        return request(.checkNotification(notificationId: notificationId))
            .asCompletable()
    }

    func fetchUncheckNotificationCount() -> Single<Int> {
        return request(.fetchUncheckNotificationCount)
            .map(UnreadCountResponse.self)
            .map { $0.unreadCount }
    }

}
