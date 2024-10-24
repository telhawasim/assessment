//
//  DetailViewController.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UILabel
    @IBOutlet weak var lblIPAddress: UILabel!
    
    //MARK: - VARIABLES -
    var ipAddress: String? {
        didSet {
            self.lblIPAddress.text = self.ipAddress
        }
    }
    
    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getIPAddress()
    }
}

//MARK: - API CALLS -
extension DetailViewController {
    
    private func getIPAddress() {
        NetworkManager.shared.fetchIPAddress { result in
            switch result {
            case .success(let ipAddress):
                DispatchQueue.main.async {
                    self.ipAddress = ipAddress
                }
            case .failure(let error):
                print("Error fetching IP Address: \(error.localizedDescription)")
            }
        }
    }
}
