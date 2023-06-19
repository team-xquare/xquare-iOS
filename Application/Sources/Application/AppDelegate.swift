import UIKit

import Firebase
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        FirebaseApp.configure()

        self.setFCM(application)

        return true
    }

}

// MARK: - Push Notification
extension AppDelegate: UNUserNotificationCenterDelegate {

    private func setFCM(_ application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()
    }

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        Messaging.messaging().apnsToken = deviceToken
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.badge, .sound, .list, .banner])
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let threadIdentifier = response.notification.request.content.threadIdentifier
        if UIApplication.shared.applicationState == .active {
            NotificationCenter.default.post(
                name: Notification.Name("touchNotification"),
                object: nil,
                userInfo: ["threadIdentifier": threadIdentifier]
            )
        } else {
            let userDefault = UserDefaults.standard
            userDefault.set(threadIdentifier, forKey: "threadIdentifier")
            userDefault.synchronize()
        }
        completionHandler()
    }

    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        // 세로방향 고정
        return UIInterfaceOrientationMask.portrait
    }
}
