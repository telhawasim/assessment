//
//  AppDelegate.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.silentAuthentication()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

//MARK: - GOOGLE SIGN IN FUNCTIONS -
extension AppDelegate {
    
    //MARK: - SILENT AUTHENTICATION -
    private func silentAuthentication() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                // There was an error restoring the sign-in state
                print("Error restoring sign-in: \(error.localizedDescription)")
                
                // Handle the error appropriately, perhaps show a login screen
                self.showLoggedOutState()
            } else if let user = user {
                // Successfully restored the previous sign-in
                print("User already signed in: \(user.profile?.email ?? "No email")")
                
                // Proceed to show the app's signed-in state
                self.showLoggedInState(for: user)
            } else {
                // No previous sign-in state was found
                print("No previous sign-in state found.")
                
                // Handle this by showing the login screen or logged-out state
                self.showLoggedOutState()
            }
        }
    }
    
    private func showLoggedInState(for user: GIDGoogleUser) {
        // Handle the signed-in user and update UI
        print("User is signed in with email: \(user.profile?.email ?? "")")
        
        // Proceed with your app's logic (navigate to home screen, etc.)
    }

    private func showLoggedOutState() {
        // Handle the logged-out state (show sign-in screen, etc.)
        print("User is logged out.")
        
        // Proceed with your app's logic (navigate to login screen, etc.)
    }
}

