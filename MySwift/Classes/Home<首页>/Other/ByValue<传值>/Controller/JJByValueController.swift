//
//  JJByValueController.swift
//  MySwift
//
//  Created by itclimb on 2017/3/15.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJByValueController: UIViewController {
    
    var models: [JJDetailModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Welcome"
        self.view.addSubview(list)
        
        loadData { (result) in
            self.models = result
            self.list.reloadData()
        }
        //监听
        NotificationCenter.default.addObserver(self, selector: #selector(notifiMethod), name: NSNotification.Name(rawValue: "AuthSuccessNotification"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func notifiMethod() {
        self.list.reloadData()
    }
    
    
    //MARK: - lazy load
    lazy var list: UITableView = {
        
        let tableView :UITableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    deinit {
        //移除
        NotificationCenter.default.removeObserver(self)
    }

}

extension JJByValueController:UITableViewDataSource,UITableViewDelegate{
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.models?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "id"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        let model = self.models?[indexPath.row]
        cell?.imageView?.image = UIImage(named: (model?.iconName)!)
        cell?.textLabel?.text = model?.title
        cell?.detailTextLabel?.text = model?.describe
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = JJDetailController()
        let model = self.models?[indexPath.row]
        vc.model = model
        
        vc.clickSaveButtonWith {[weak self] in
            self?.list.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension JJByValueController{
    //加载模拟数据
    func loadData(sucess: @escaping(_ models: [JJDetailModel]) -> ()) {
        
        var models: [JJDetailModel] = [JJDetailModel]()
        for i in 0..<10 {
            let title = "ios\(i)"
            let describe = "hello iphone7 plus"
            let iconName = "dog"
            let dict: [String : Any] = [
                "title":title,
                "describe":describe,
                "iconName":iconName
            ]
            let model = JJDetailModel(dict: dict)
            models.append(model)
            sucess(models)
        }
        
    }
}
