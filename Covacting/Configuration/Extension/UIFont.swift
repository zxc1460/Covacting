//
//  UIFont.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import Foundation
import UIKit

extension UIFont {
    public enum AppleSDGothicNeoType: String {
        case bold = "Bold"
        case regular = "Regular"
        case medium = "Medium"
    }
    
    public enum GmarketSansType: String {
        case bold = "Bold"
        case light = "Light"
        case medium = "Medium"
    }

    static func AppleSDGothicNeo(_ type: AppleSDGothicNeoType, size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-\(type.rawValue)", size: size)!
    }
    
    static func GmarketSans(_ type: GmarketSansType, size: CGFloat) -> UIFont {
        return UIFont(name: "GmarketSans\(type.rawValue)", size: size)!
    }
}
