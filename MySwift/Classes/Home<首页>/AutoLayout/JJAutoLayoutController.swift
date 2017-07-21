//
//  JJAutoLayoutController.swift
//  MySwift
//
//  Created by itclimb on 2017/6/28.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJAutoLayoutController: UIViewController {

    var codeLayoutButton: UIButton!
    var snapKitLayoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        codeLayoutButton = UIButton(type: .custom);
        codeLayoutButton.backgroundColor = .blue
        codeLayoutButton.setTitle("代码布局", for: .normal)
        view.addSubview(codeLayoutButton)
        codeLayoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.layoutMargins);
            make.height.equalTo(80);
        }
        codeLayoutButton.addTarget(self, action: #selector(codeLayoutClick(button:)), for: .touchUpInside)
        
        snapKitLayoutButton = UIButton(type: .custom);
        snapKitLayoutButton.backgroundColor = .magenta
        snapKitLayoutButton.setTitle("SnapKit布局", for: .normal)
        view.addSubview(snapKitLayoutButton);
        snapKitLayoutButton.snp.makeConstraints { (make) in
            make.top.equalTo(codeLayoutButton.snp.bottom).offset(30)
            make.leading.trailing.equalTo(self.view.layoutMargins)
            make.height.equalTo(80)
        }
        snapKitLayoutButton.addTarget(self, action: #selector(snapKitLayout(button:)), for: .touchUpInside)
    }
    
    //代码布局
    func codeLayoutClick(button: UIButton) {
        let codeVc = JJCodeLayoutController()
        navigationController?.pushViewController(codeVc, animated: true)
    }
    //SnapKit布局
    func snapKitLayout(button: UIButton) {
        let snapKitVc = JJSnapKitLayoutController()
        navigationController?.pushViewController(snapKitVc, animated: true)
    }

}
