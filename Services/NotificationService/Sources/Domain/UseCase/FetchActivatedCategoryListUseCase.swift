import Foundation

import RxSwift

public class FetchActivatedCategoryListUseCase {

    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[CategoryEntity]> {
        return repository.fetchActivatedNotificationCategoryList()
    }

}
