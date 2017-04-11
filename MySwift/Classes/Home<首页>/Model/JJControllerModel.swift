//
//  JJControllerModel.swift
//  MySwift
//
//  Created by itclimb on 2017/3/14.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJControllerModel: NSObject {

    var vcName: String?
    var vcType: String?
    var vcTitle: String?

    init(dict: [String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    //防止崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        
    }
    
}
