import Foundation

import RxSwift

class NotificationRepositoryImpl: NotificationRepository {

    let remoteDataSource: RemoteNotificationDataSource

    init(remoteDataSource: RemoteNotificationDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchNotificationCategoryList(defaultActivated: Bool) -> Observable<[CategoryEntity]> {
        return remoteDataSource.fetchNotificationCategoryList(defaultActivated: defaultActivated)
            .asObservable()
    }

    func fetchActivatedNotificationCategoryList() -> Observable<[CategoryEntity]> {
        return remoteDataSource.fetchActivatedNotificationCategoryList()
            .asObservable()
    }

    func activeNotificationCategory(categoryId: String) -> Completable {
        return remoteDataSource.activeNotificationCategory(categoryId: categoryId)
    }

    func inactiveNotificationCategory(categoryId: String) -> RxSwift.Completable {
        return remoteDataSource.inactiveNotificationCategory(categoryId: categoryId)
    }

    func fetchPostedNotificationList() -> Observable<[NotificationEntity]> {
        return remoteDataSource.fetchPostedNotificationList()
            .asObservable()
    }

    func checkNotification(notificationId: String) -> Completable {
        return remoteDataSource.checkNotification(notificationId: notificationId)
    }

    func fetchUncheckNotificationCount() -> Observable<Int> {
        return fetchUncheckNotificationCount()
            .asObservable()
    }

}
