//
//  HomeViewController.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - OUTLETS -

    //UIView
    @IBOutlet weak var centerView: UIView!
    
    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.addTapGesture()
    }
}

//MARK: - FUNCTIONS -
extension HomeViewController {
    
    //MARK: - SETUP UI -
    private func setupUI() {
        self.centerView.applyCornerRadius(12.0, shadowColor: .black, shadowOpacity: 0.3, shadowOffset: CGSize(width: 0, height: 0), shadowRadius: 8)
    }
    
    //MARK: - ADD TAP GESTURE -
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapCenterView(_:)))
        
        self.centerView.addGestureRecognizer(tap)
        self.centerView.isUserInteractionEnabled = true
    }
    
    //MARK: - DID TAP CENTER VIEW -
    @objc func didTapCenterView(_ sender: UITapGestureRecognizer) {
        Routing.shared.navigateToDetailScreen(from: self)
    }
}
