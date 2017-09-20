//
//  JJSnapKitModel.swift
//  MySwift
//
//  Created by itclimb on 2017/6/28.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJSnapKitModel: NSObject {

    var title: String!
    var author: String!
    var content: String!
    var isExpand = false //注：swift中数字必须赋值！
    
    init(dict: [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
        
    }
    
}
