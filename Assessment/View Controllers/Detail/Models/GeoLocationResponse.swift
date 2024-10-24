//
//  GeoLocationResponse.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation

struct GeoLocationResponse: Codable {
    var ip: String?
    var city: String?
    var region: String?
    var country: String?
    var loc: String?
    var org: String?
    var postal: String?
    var timezone: String?
    var readme: String?
}
