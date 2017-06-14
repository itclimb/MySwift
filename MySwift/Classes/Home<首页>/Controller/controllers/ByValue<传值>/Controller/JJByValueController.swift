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
        tableView.register(JJByValueCell.classForCoder(), forCellReuseIdentifier: "cellId")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as? JJByValueCell
        let model = self.models?[indexPath.row]
        cell?.icon.image = UIImage.init(named: (model?.iconName)!)
        cell?.first.text = model?.title
        cell?.second.text = model?.describe
        cell?.separatorInset = .zero
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = JJDetailController()
        let model = self.models?[indexPath.row]
        vc.model = model
        
        vc.clickSaveButtonWith {[weak self] in
            self?.list.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
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

fileprivate class JJByValueCell: UITableViewCell {
    
    var icon: UIImageView!, first: UILabel!, second: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        icon = UIImageView()
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = 40
        icon.image = UIImage.init(named: "dog")
        contentView.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView).offset(10)
            make.width.height.equalTo(80)
            make.centerY.equalTo(contentView)
        }
        
        first = UILabel()
        first.font = UIFont(name: "Gurmukhi MN", size: 18.0)
        first.textColor = UIColor.black
        first.backgroundColor = UIColor.white
        contentView.addSubview(first)
        first.snp.makeConstraints { (make) in
            make.leading.equalTo(icon.snp.trailing).offset(20)
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView)
            make.height.equalTo(30)
        }
        
        second = UILabel()
        second.font = UIFont(name: "", size: 17.0)
        second.textColor = UIColor.darkGray
        second.backgroundColor = UIColor.white
        contentView.addSubview(second)
        second.snp.makeConstraints { (make) in
            make.leading.equalTo(first)
            make.top.equalTo(first.snp.bottom).offset(10)
            make.right.equalTo(contentView)
            make.height.equalTo(30)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
}
