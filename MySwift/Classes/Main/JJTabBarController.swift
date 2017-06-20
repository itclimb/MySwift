//
//  JJTabBarController.swift
//  MySwift
//
//  Created by itclimb on 2017/3/10.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVc = JJHomeController()
        addChildViewController(VieWContorller: homeVc, titleName: "首页", imageName: "TabBar_home")
        let tableVc = JJTableViewController()
        addChildViewController(VieWContorller: tableVc, titleName: "设置", imageName: "TabBar_withdrawDeposit")
    }
    
    fileprivate func addChildViewController( VieWContorller:UIViewController , titleName:String , imageName:String){
        
        VieWContorller.tabBarItem.image = UIImage(named: imageName )
        VieWContorller.tabBarItem.selectedImage  = UIImage(named: imageName + "_select")
        VieWContorller.title = titleName
        let nav = JJBaseNaviController()
        nav.addChildViewController(VieWContorller)
        addChildViewController(nav)
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
