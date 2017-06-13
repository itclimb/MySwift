//
//  UIScreen_Extension.swift
//  MySwift
//
//  Created by itclimb on 13/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen{
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    static var size: CGSize {
        return UIScreen.main.bounds.size
    }
    static var size_swap: CGSize {
        return CGSize(width: width, height: height)
    }
}
