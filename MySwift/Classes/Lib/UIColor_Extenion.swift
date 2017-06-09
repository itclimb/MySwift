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
    //value function
    static func RGBValue(_ value: UInt32) -> UIColor {
        let red   = (value & 0x00FF0000) >> 16
        let green = (value & 0x0000FF00) >> 8
        let blue  = (value & 0x000000FF)
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(1))
    }
    //value and alpha setting function
    func RGBAValue(_ value: UInt32) -> UIColor {
        let red = (value & 0xFF000000) >> 24
        let green = (value & 0x00FF0000) >> 16
        let blue = (value & 0x0000FF00) >> 8
        let alpha = (value * 0x000000FF)
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha)/255.0)
    }
}
