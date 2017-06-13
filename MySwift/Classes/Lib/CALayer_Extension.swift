//
//  CALayer_Extension.swift
//  MySwift
//
//  Created by itclimb on 09/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import Foundation
import UIKit

extension CALayer{
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.centerX
        }
        set {
            self.centerX = newValue
        }
    }
    var centerY: CGFloat {
        get {
            return self.centerY
        }
        set {
            self.centerY = newValue
        }
    }
    
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
}
