//
//  UIView+Ext.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: - APPLY CORNER RAIDUS -
    func applyCornerRadius(_ radius: CGFloat,
                           borderWidth: CGFloat = 0.0,
                           borderColor: UIColor? = nil,
                           shadowColor: UIColor? = nil,
                           shadowOpacity: Float = 0.0,
                           shadowOffset: CGSize = .zero,
                           shadowRadius: CGFloat = 0.0) {
        // Apply corner radius
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        // Apply optional border
        if borderWidth > 0 {
            self.layer.borderWidth = borderWidth
        }
        
        if let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
        }
        
        if shadowOpacity > 0 {
            self.layer.masksToBounds = false
            self.layer.shadowColor = shadowColor?.cgColor ?? UIColor.black.cgColor
            self.layer.shadowOpacity = shadowOpacity
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
        }
    }
}
