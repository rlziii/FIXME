import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - UIWindowSceneDelegate Methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            preconditionFailure("Could not cast \(UIScene.self) to \(UIWindowScene.self).")
        }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
    }
}
