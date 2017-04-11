//
//  JJBaseNaviController.swift
//  MySwift
//
//  Created by itclimb on 2017/3/2.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJBaseNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //设置自定义返回按钮
    var backBtn: UIButton {
        
        let backBtn = UIButton(type: UIButtonType.custom)
        backBtn.setImage(UIImage(named:"left_arrow"), for: .normal)
        backBtn.titleLabel?.isHidden = true
        backBtn.addTarget(self, action: #selector(self.backButtonClick(_:)), for: .touchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        let backBtnW: CGFloat = (UIScreen.main.bounds.size.width > 375.0) ? 30:25
        backBtn.frame = CGRect(x: 0, y: 0, width: backBtnW, height: 30)
        return backBtn
    }
    

    //重写导航控制器的push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        viewController.navigationItem.hidesBackButton = true
        
        if childViewControllers.count > 0 {
            
            UINavigationBar.appearance().backItem?.hidesBackButton=false
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            //隐藏底部标签
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    //
    func backButtonClick(_ sender: UIButton) {
        
        popViewController(animated: true)
    }
}
