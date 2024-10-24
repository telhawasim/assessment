//
//  StoryBoardEnum.swift
//  Assessment
//
//  Created by Telha Wasim on 24/10/2024.
//

import Foundation
import UIKit

enum StoryBoardEnum: String {
    case main = "Main"
    
    var getStoryboard: UIStoryboard? {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}
