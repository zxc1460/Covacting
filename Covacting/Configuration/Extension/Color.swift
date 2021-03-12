//
//  Color.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var brightBlue: UIColor {
        UIColor(hex: 0x0064ff) }
    class var brownishGrey: UIColor {
        UIColor(hex: 0x5f5f5f) }
    class var deepSkyBlue: UIColor {
        UIColor(hex: 0x0a7aff) }
    class var orangeYellow: UIColor {
        UIColor(hex: 0xff9d00) }
    class var frogGreen: UIColor {
        UIColor(hex: 0x59ce0c) }
    class var tomatoRed: UIColor {
        UIColor(hex: 0xf02800) }
    class var veryLightBlue: UIColor {
        UIColor(hex: 0xdcebff) }
}

