import Foundation

import RxSwift

public class ActiveNotificationCategoryUseCase {

    private let repositry: NotificationRepository

    init(repositry: NotificationRepository) {
        self.repositry = repositry
    }

    public func excute(categoryId: String) -> Completable {
        return repositry.activeNotificationCategory(categoryId: categoryId)
    }

}
