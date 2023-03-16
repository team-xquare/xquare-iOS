import Foundation

public struct NotificationServiceDependency {
    public static let shared = Self.resolve()
    public let fetchNotificationCategoryListUseCase: FetchNotificationCategoryListUseCase
    public let fetchActivitedCategoryLiseUseCase: FetchActivatedCategoryListUseCase
    public let activeNotificationCategoryUseCase: ActiveNotificationCategoryUseCase
    public let inactiveNotificationCategoryUseCase: InactiveNotifcationCategoryUseCase
    public let fetchPostedNotificationListUseCase: FetchPostedNotificationListUseCase
    public let checkNotificationUseCase: CheckNotificationUseCase
    public let fetchUncheckNotificationCountUseCase: FetchUncheckNotificationCountUseCase
}

extension NotificationServiceDependency {

    static func resolve() -> NotificationServiceDependency {

        let remoteDataSource = RemoteNotificationDataSourceImpl()
        let repository = NotificationRepositoryImpl(remoteDataSource: remoteDataSource)

        let fetchNotificationCategoryListUseCase = FetchNotificationCategoryListUseCase(
            repository: repository
        )
        let fetchActivitedCategoryListUseCase = FetchActivatedCategoryListUseCase(
            repository: repository
        )
        let activeNotificationCategoryUseCase = ActiveNotificationCategoryUseCase(
            repositry: repository
        )
        let inactiveNotificationCategoryUseCase = InactiveNotifcationCategoryUseCase(
            reposiotry: repository
        )
        let fetchPostedNotificationListUseCase = FetchPostedNotificationListUseCase(
            repository: repository
        )
        let checkNotificationUseCase = CheckNotificationUseCase(
            repository: repository
        )
        let fetchUncheckNotificationCountUseCase = FetchUncheckNotificationCountUseCase(
            repository: repository
        )

        return .init(
            fetchNotificationCategoryListUseCase: fetchNotificationCategoryListUseCase,
            fetchActivitedCategoryLiseUseCase: fetchActivitedCategoryListUseCase,
            activeNotificationCategoryUseCase: activeNotificationCategoryUseCase,
            inactiveNotificationCategoryUseCase: inactiveNotificationCategoryUseCase,
            fetchPostedNotificationListUseCase: fetchPostedNotificationListUseCase,
            checkNotificationUseCase: checkNotificationUseCase,
            fetchUncheckNotificationCountUseCase: fetchUncheckNotificationCountUseCase
        )
    }

}
