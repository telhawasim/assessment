//
//  Routing.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation
import UIKit

class Routing {
    
    //MARK: - VARIABLES -
    static let shared = Routing()
    
    //MARK: - INITIALIZER -
    private init() { }
    
    //MARK: - SET ROOT VIEW CONTROLLER -
    func setRootViewController() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let vc = StoryBoardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: SignInViewController.identifier) as! SignInViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.viewControllers = [vc]
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = nav
        })
        
        window.makeKeyAndVisible()
    }
    
    //MARK: - NAVIGATE TO HOME SCREEN -
    func navigateToHomeScreen(from viewController: UIViewController) {
        let vc = StoryBoardEnum.main.getStoryboard?.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - NAVIGATE TO DETAIL SCREEN -
    func navigateToDetailScreen(from viewController: UIViewController) {
        let vc = StoryBoardEnum.main.getStoryboard?.instantiateViewController(identifier: DetailViewController.identifier) as! DetailViewController
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
