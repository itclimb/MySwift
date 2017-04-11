//
//  JJUser.swift
//  MySwift
//
//  Created by itclimb on 2017/3/13.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJUser: NSObject {
    static let instance = JJUser()
    
    private override init() {
        userName = UserDefaults.juser.user_name.stringValue
        userId = UserDefaults.juser.user_id.value as! String?
    }
    
    var userName: String? {
        didSet{
            UserDefaults.juser.user_name.store(value: userName)
        }
    }
    
    var userId: String? {
        didSet{
            UserDefaults.juser.user_id.store(value: userId)
        }
    }
    
    
    
}
		
