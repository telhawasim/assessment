//
//  SignInViewController.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation
import UIKit
import GoogleSignIn

class SignInViewController: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UIView
    @IBOutlet weak var buttonView: UIView!

    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    //MARK: - DID TAP GOOGLE SIGN IN BUTTON -
    @IBAction func didTapGoogleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { singInResult, error in
            guard error == nil else {
                return
            }
            
        }
    }
}

//MARK: - FUNCTIONS -
extension SignInViewController {
    
    //MARK: - SETUP UI -
    private func setupUI() {
        self.buttonView.applyCornerRadius(12.0, shadowColor: .black, shadowOpacity: 0.3, shadowOffset: CGSize(width: 0, height: 0), shadowRadius: 8)
    }
}
