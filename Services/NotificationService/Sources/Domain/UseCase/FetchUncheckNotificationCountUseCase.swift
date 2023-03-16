import Foundation

import RxSwift

public class FetchUncheckNotificationCountUseCase {

    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<Int> {
        return repository.fetchUncheckNotificationCount()
    }

}
