//
//  JJUserDefaultsExtension.swift
//  MySwift
//
//  Created by itclimb on 2017/3/13.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import Foundation

extension UserDefaults{
    //String 已经遵循RawRepresentable和RawValue两个协议
    enum juser: String,UserDefaultsSetMode {
        case user_name
        case user_id
        case user_age
        case user_phone
    }
}
