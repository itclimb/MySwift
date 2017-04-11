//
//  JJCommonModel.swift
//  MySwift
//
//  Created by itclimb on 30/03/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import HandyJSON
import Charts

struct JJConsumeModel: HandyJSON {
    var money: String?
    var sign_id: String?
    
}

struct JJCompanyModel: HandyJSON {
    
    var strColor : String?
    
    var image : String?
    
    var title : String?
    
    var yw_id : String?
    
    var isSelected : Bool!
    
    
    static func getModels() -> [JJCompanyModel] {
        let plist = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "logoList", ofType: "plist")!)
        var array : [JJCompanyModel] = Array()
        for dict in plist! {
            var model = JSONDeserializer<JJCompanyModel>.deserializeFrom(dict: dict as? NSDictionary)!
            model.isSelected = false
            array.append(model)
        }
        
        return array
    }
    
    static func getCompanyColors() -> [UIColor] {
        let models = getModels()
        var array : [UIColor] = Array()
        for model in models {
            array.append(ChartColorTemplates.colorFromString("#"+model.strColor!))
        }
        return array
    }
}
