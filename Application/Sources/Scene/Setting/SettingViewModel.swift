import SwiftUI

import RxSwift
import NotificationService
import AuthService

class SettingViewModel: ObservableObject {
    @Published var isFeedToggle: Bool = false
    @Published var isApplicationToggle: Bool = false
    @Published var isAllToggle: Bool = false
    @Published var isScheduleToggle: Bool = false
    @Published var isSucceed: Bool = false
    @Published var showQuitAlert: Bool = false
    @Published var showLogoutAlert: Bool = false

    private let activeNotificationCategoryUseCase: ActiveNotificationCategoryUseCase
    private let fetchActivatedCategoryListUseCase: FetchActivatedCategoryListUseCase
    private let logoutUseCase: LogoutUseCase

    init(
        activeNotificationCategoryUseCase: ActiveNotificationCategoryUseCase,
        fetchActivatedCategoryListUseCase: FetchActivatedCategoryListUseCase,
        logoutUseCase: LogoutUseCase
    ) {
        self.activeNotificationCategoryUseCase = activeNotificationCategoryUseCase
        self.fetchActivatedCategoryListUseCase = fetchActivatedCategoryListUseCase
        self.logoutUseCase = logoutUseCase
    }

    private var disposeBag = DisposeBag()

    func activeNotificationCategory() {
        self.activeNotificationCategoryUseCase.excute(topics: [
            .all: self.isAllToggle,
            .application: self.isApplicationToggle,
            .feed: self.isFeedToggle,
            .schedule: self.isScheduleToggle
        ])
        .subscribe(onCompleted: { self.isSucceed = true })
        .disposed(by: disposeBag)
    }

    func fetchActivatedCategoryList() {
        self.fetchActivatedCategoryListUseCase.excute()
            .subscribe(onNext: {
                $0.forEach {
                    switch $0.topic {
                    case .feed: self.isFeedToggle = $0.isActivate
                    case .application: self.isApplicationToggle = $0.isActivate
                    case .all: self.isAllToggle = $0.isActivate
                    case .schedule: self.isScheduleToggle = $0.isActivate
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    func logout() {
        self.logoutUseCase.excute()
            .subscribe(onCompleted: { })
            .disposed(by: disposeBag)
    }
}
