import SwiftUI

import RxSwift
import NotificationService

class SettingViewModel: ObservableObject {
    @Published var isFeedToggle: Bool = false
    @Published var isApplicationToggle: Bool = false
    @Published var isAllToggle: Bool = false
    @Published var isScheduleToggle: Bool = false
    @Published var isSucceed: Bool = false

    private let activeNotificationCategoryUseCase: ActiveNotificationCategoryUseCase
    private let fetchActivatedCategoryListUseCase: FetchActivatedCategoryListUseCase

    init(
        activeNotificationCategoryUseCase: ActiveNotificationCategoryUseCase,
        fetchActivatedCategoryListUseCase: FetchActivatedCategoryListUseCase
    ) {
        self.activeNotificationCategoryUseCase = activeNotificationCategoryUseCase
        self.fetchActivatedCategoryListUseCase = fetchActivatedCategoryListUseCase
    }

    private var disposeBag = DisposeBag()

    func activeNotificationCategory(topic: String, isActivated: Bool) {
        self.activeNotificationCategoryUseCase.excute(topic: topic, isActivated: isActivated)
            .subscribe(onCompleted: { self.isSucceed = true })
            .disposed(by: disposeBag)
    }

    func fetchActivatedCategoryList() {
        self.fetchActivatedCategoryListUseCase.excute()
            .subscribe(onNext: {
                $0.forEach {
                    switch $0.topic {
                    case .FEED: self.isFeedToggle = $0.isActivate
                    case .APPLICATION: self.isApplicationToggle = $0.isActivate
                    case .ALL: self.isAllToggle = $0.isActivate
                    case .SCHEDULE: self.isScheduleToggle = $0.isActivate
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
