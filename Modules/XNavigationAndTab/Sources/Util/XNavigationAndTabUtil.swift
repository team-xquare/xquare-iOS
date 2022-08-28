import UIKit

public struct XNavigationAndTabUtil {

    public static func popToRootView() {
        findNavigationController(viewController: findRootViewController())?
            .popToRootViewController(animated: true)
    }

    public static func moveToFirstTab() {
        findTabController(viewController: findRootViewController())?
            .selectedIndex = 0
    }

}

extension XNavigationAndTabUtil {
    static private func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else { return nil }
        if let navigationController = viewController as? UINavigationController {  return navigationController }
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        return nil
    }

    static private func findTabController(viewController: UIViewController?) -> UITabBarController? {
        guard let viewController = viewController else { return nil }
        if let tabBarController = viewController as? UITabBarController { return tabBarController }
        for childViewController in viewController.children {
            return findTabController(viewController: childViewController)
        }
        return nil
    }

    static private func findRootViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let windows = windowScene?.windows
        let firstKeyWindow = windows?.filter { $0.isKeyWindow }.first
        return firstKeyWindow?.rootViewController
    }
}
