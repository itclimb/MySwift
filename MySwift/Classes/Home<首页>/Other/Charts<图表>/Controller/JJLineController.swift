//
//  JJLineController.swift
//  MySwift
//
//  Created by itclimb on 05/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJLineController: UIViewController {

    var lineView = JJChartsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        lineView.chartsType = JJChartsType.lineCharts
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
