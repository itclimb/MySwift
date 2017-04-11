//
//  JJUserDefaultsProtocol.swift
//  MySwift
//
//  Created by itclimb on 2017/3/13.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import Foundation

public protocol UserDefaultsSetMode {
    
    var uniqueKey:String{get}
    
}

public extension UserDefaultsSetMode where Self:RawRepresentable,Self.RawValue == String{
    
    //Any类型
    public func store(value: Any?){
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    public var value: Any?{
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    public var stringValue: String?{
        return value as? String
    }
    
    //URL类型
    public func store(url: URL?){
        UserDefaults.standard.set(url, forKey: uniqueKey)
    }
    public var urlValue: URL?{
        return UserDefaults.standard.url(forKey: uniqueKey)
    }
    
    //Bool类型
    public func store(value: Bool?){
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    public var boolValue: Bool?{
        return UserDefaults.standard.bool(forKey: uniqueKey)
    }
    
    /**
     *更多数据类型.....
     */
    
    //Get方法
    public var uniqueKey: String{
        return "\(Self.self).\(rawValue)"
    }
    
    //移除方法
    func remove() {
        UserDefaults.standard.removeObject(forKey: uniqueKey)
    }
}
