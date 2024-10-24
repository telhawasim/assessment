//
//  SceneDelegate.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import UIKit
import GoogleSignIn
import Network

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        self.checkIfUserIsLoggedIn(window: self.window)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

//MARK: - FUNCTIONS -
extension SceneDelegate {
    
    //MARK: - CHECK IF USER IS LOGGED IN -
    private func checkIfUserIsLoggedIn(window: UIWindow?) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")

        monitor.start(queue: queue)
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if let _ = error {
                            self.loginAsRoot()
                        } else if let _ = user {
                            self.homeAsRoot()
                        }
                    }
                } else {
                    GIDSignIn.sharedInstance.signOut()
                    self.loginAsRoot()
                }
                self.window?.makeKeyAndVisible()
            }
        }
    }
    
    //MARK: - LOGIN AS ROOT -
    private func loginAsRoot() {
        let vc = StoryBoardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: SignInViewController.identifier) as! SignInViewController
        let navController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navController
    }
    
    //MARK: - HOME AS ROOT -
    private func homeAsRoot() {
        let vc = StoryBoardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        let navController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navController
    }
}

