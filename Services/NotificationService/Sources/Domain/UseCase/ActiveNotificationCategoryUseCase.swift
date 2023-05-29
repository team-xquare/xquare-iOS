import Foundation

import RxSwift

public class ActiveNotificationCategoryUseCase {

    private let repositry: NotificationRepository

    init(repositry: NotificationRepository) {
        self.repositry = repositry
    }

    public func excute(topics: [NotificationActivateTopic: Bool]) -> Completable {
        let observables = topics.map {
            return repositry.activeNotificationCategory(topic: $0.key, isActivated: $0.value)
        }
        return Completable.zip(observables)
    }

}
