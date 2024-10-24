//
//  NSObject+Ext.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
