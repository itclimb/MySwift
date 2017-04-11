//
//  JJPieController.swift
//  MySwift
//
//  Created by itclimb on 29/03/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//  饼图/条形图控制器

import UIKit
import SnapKit

class JJPieController: UIViewController {

    var chartView = JJChartsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(chartView)
        chartView.backgroundColor = UIColor.lightGray
        chartView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalTo(self.view)
            make.height.equalTo(200)
        }
        chartView.chartsType = .pieCharts
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
