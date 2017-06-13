//
//  UIColor_Extenion.swift
//  MySwift
//
//  Created by itclimb on 09/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    //rgb function
    static func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
    //rgb and alpha setting function
    static func RGBA(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    //Hex value function
    static func RGBValue(_ value: UInt32) -> UIColor {
        let red   = (value & 0x00FF0000) >> 16
        let green = (value & 0x0000FF00) >> 8
        let blue  = (value & 0x000000FF)
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(1))
    }
    //Hex value and alpha setting function
    func RGBAValue(_ value: UInt32) -> UIColor {
        let red = (value & 0xFF000000) >> 24
        let green = (value & 0x00FF0000) >> 16
        let blue = (value & 0x0000FF00) >> 8
        let alpha = (value * 0x000000FF)
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
    }
    
    
    //随机色
    static var random : UIColor  {
        let aRedValue   = (CGFloat)(arc4random() % 255),
        aGreenValue = (CGFloat)(arc4random() % 255),
        aBlueValue  = (CGFloat)(arc4random() % 255)
        return UIColor(red: aRedValue / 255.0, green: aGreenValue / 255.0, blue: aBlueValue / 255.0, alpha: 1.0)
    }
    //RGB
    static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
    }
    //RGB and Alpha
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return rgba(r: r, g: g, b: b, a: 0xff)
    }
    
    //Hex value
    static func colorWithHexString (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
