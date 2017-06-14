//
//  JJTestViewController.swift
//  MySwift
//
//  Created by itclimb on 09/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJTestViewController: UIViewController {
    
    var testView : UIView! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        testView = UIView()
        testView.backgroundColor = UIColor.red
        testView.x = 100
        testView.y = 100
        testView.width = 100
        testView.height = 100
        view.addSubview(testView)
    
    }
    

    
}
