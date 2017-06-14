//
//  JJBarController.swift
//  MySwift
//
//  Created by itclimb on 05/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import SnapKit

class JJBarController: UIViewController {

    var barView = JJChartsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(barView)
        barView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(200)
        }
        barView.chartsType = .barCharts
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
