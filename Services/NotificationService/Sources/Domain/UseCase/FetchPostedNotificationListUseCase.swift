import Foundation

import RxSwift

public class FetchPostedNotificationListUseCase {

    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    public func excute(categoryId: String) -> Observable<[NotificationEntity]> {
        return repository.fetchPostedNotificationList()
    }

}
