import Foundation

import RxSwift

public class FetchNotificationCategoryListUseCase {

    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    public func excute(defaultActivated: Bool) -> Observable<[CategoryEntity]> {
        return repository.fetchNotificationCategoryList(defaultActivated: defaultActivated)
    }

}
