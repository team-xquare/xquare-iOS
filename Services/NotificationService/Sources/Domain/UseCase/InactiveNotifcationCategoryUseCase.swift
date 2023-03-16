import Foundation

import RxSwift

public class InactiveNotifcationCategoryUseCase {

    private let reposiotry: NotificationRepository

    init(reposiotry: NotificationRepository) {
        self.reposiotry = reposiotry
    }

    public func excute(categoryId: String) -> Completable {
        return reposiotry.inactiveNotificationCategory(categoryId: categoryId)
    }

}
