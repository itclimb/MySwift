//
//  JJDetailModel.swift
//  MySwift
//
//  Created by itclimb on 2017/3/16.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJDetailModel: NSObject {
    
    var iconName:String?
    var title:String?
    var describe:String?
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    //防止崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        
    }

}


