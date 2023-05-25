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

    func activeNotificationCategory(topic: String, isActivated: Bool) -> Completable {
        return remoteDataSource.activeNotificationCategory(topic: topic, isActivated: isActivated)
    }

    func fetchPostedNotificationList() -> Observable<[NotificationEntity]> {
        return remoteDataSource.fetchPostedNotificationList()
            .asObservable()
    }

    func checkNotification(notificationId: String) -> Completable {
        return remoteDataSource.checkNotification(notificationId: notificationId)
    }

    func fetchUncheckNotificationCount() -> Observable<Int> {
        return remoteDataSource.fetchUncheckNotificationCount()
            .asObservable()
    }

}
