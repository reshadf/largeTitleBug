//
//  SceneDelegate.swift
//  largeTitleBug
//
//  Created by Reshad Farid on 27/10/2025.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure we have a window scene
        guard let windowScene = scene as? UIWindowScene else { return }

        // Create your initial view controller hierarchy
        let viewController = TabVC()
        viewController.view.backgroundColor = .red

        let navigationController = UINavigationController(rootViewController: viewController)

        // Create and attach the window to this scene
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Restart any tasks paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Sent when the scene will move from an active state to an inactive state.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
    }
}

class TabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = createNavigationController(viewController: MainVC())
        vc1.tabBarItem = UITabBarItem(title: "One", image: nil, tag: 0)
        
        let vc2 = createNavigationController(viewController: SubVC())
        vc2.tabBarItem = UITabBarItem(title: "Two", image: nil, tag: 0)
        
        self.viewControllers = [vc1, vc2]
    }
}

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Large Title"
//        navigationItem.largeTitleDisplayMode = .always
        
        let swiftUIView = MainView()
        
        // Embed the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the frame and constraints for the hosting controller's view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Notify the hosting controller that it has been moved to a parent view controller
        hostingController.didMove(toParent: self)
    }
}

class SubVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sub Large Title"
//        navigationItem.largeTitleDisplayMode = .always
        
        self.view.backgroundColor = .red
    }
}

struct MainView: View {
    
    var body: some View {
        Text("Hello, World!")
    }
}

func createNavigationController(viewController: UIViewController) -> UINavigationController {
    
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.view.backgroundColor = .green
    navigationController.navigationBar.prefersLargeTitles = true
    
    return navigationController
}
