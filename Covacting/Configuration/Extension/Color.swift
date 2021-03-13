//
//  Color.swift
//  Covacting
//
//  Created by Seok on 2021/03/12.
//

import UIKit

extension UIColor {
    // 제플린 기준으로 네이밍한 컬러 코드
    @nonobjc class var brightBlue: UIColor {
      return UIColor(red: 0.0, green: 100.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    @nonobjc class var brownishGrey: UIColor {
      return UIColor(white: 95.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var deepSkyBlue: UIColor {
      return UIColor(red: 10.0 / 255.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    @nonobjc class var orangeYellow: UIColor {
      return UIColor(red: 1.0, green: 157.0 / 255.0, blue: 0.0, alpha: 1.0)
    }

    @nonobjc class var frogGreen: UIColor {
      return UIColor(red: 89.0 / 255.0, green: 206.0 / 255.0, blue: 12.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var tomatoRed: UIColor {
      return UIColor(red: 240.0 / 255.0, green: 40.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    @nonobjc class var veryLightBlue: UIColor {
      return UIColor(red: 220.0 / 255.0, green: 235.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    
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

