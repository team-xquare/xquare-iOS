import Foundation

import NotificationService
import RxSwift

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationEntity] = []

    private let fetchPostedNotificationListUseCase: FetchPostedNotificationListUseCase
    private var disposeBag = DisposeBag()

    init(fetchPostedNotificationListUseCase: FetchPostedNotificationListUseCase) {
        self.fetchPostedNotificationListUseCase = fetchPostedNotificationListUseCase
    }

    func fetchNotification() {
        self.fetchPostedNotificationListUseCase.excute()
            .subscribe(onNext: {
                self.notifications = $0
            })
            .disposed(by: disposeBag)
    }
}
