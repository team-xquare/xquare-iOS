import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScence = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScence)
        window?.windowScene = windowScence

//        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

}
