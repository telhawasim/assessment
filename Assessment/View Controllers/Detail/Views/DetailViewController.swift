//
//  DetailViewController.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import UIKit
import GoogleSignIn

class DetailViewController: UIViewController {
    
    //MARK: - OUTLETS -
    
    //UILabel
    @IBOutlet weak var lblIPAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblTimeZone: UILabel!
    
    //MARK: - VARIABLES -
    var ipAddress: String? {
        didSet {
            self.lblIPAddress.text = self.ipAddress
            self.geoLocationAPICall()
        }
    }
    
    //MARK: - LIFECYCLE -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ipAddressAPICall()
    }
    
    //MARK: - DID TAP LOGOUT -
    @IBAction func didTapLogout() {
        GIDSignIn.sharedInstance.signOut()
        Routing.shared.setRootViewController()
    }
}

//MARK: - FUNCTIONS -
extension DetailViewController {
    
    //MARK: - IP ADDRESS API CALL -
    private func ipAddressAPICall() {
        self.fetchIPAddress() { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.ipAddress = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: - GEO LOCATION API CALL -
    private func geoLocationAPICall() {
        self.fetchGeoInformation(ipAddress: self.ipAddress) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.lblCity.text = success?.city
                    self.lblRegion.text = success?.region
                    self.lblCountry.text = success?.country
                    self.lblLocation.text = success?.loc
                    self.lblCompany.text = success?.org
                    self.lblPostal.text = success?.postal
                    self.lblTimeZone.text = success?.timezone
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

//MARK: - API CALLS -
extension DetailViewController {
    
    //MARK: - FETCH IP ADDRESS -
    func fetchIPAddress(completion: @escaping (Result<String?, Error>) -> Void) {
        let urlString = "https://api.ipify.org?format=json"
        
        NetworkManager.shared.request(urlString, resultType: IPAdressResponse.self) { result in
            switch result {
            case .success(let ipResponse):
                completion(.success(ipResponse.ip))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - FETCH GEO INFORMATION -
    func fetchGeoInformation(ipAddress: String?, completion: @escaping (Result<GeoLocationResponse?, Error>) -> Void) {
        guard let ipAddress = self.ipAddress else {
            return
        }
        let urlString = "https://ipinfo.io/\(ipAddress)/geo"
        
        NetworkManager.shared.request(urlString, resultType: GeoLocationResponse.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
