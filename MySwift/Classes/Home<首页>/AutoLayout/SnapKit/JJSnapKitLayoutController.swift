//
//  JJSnapKitLayoutController.swift
//  MySwift
//
//  Created by itclimb on 2017/6/28.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJSnapKitLayoutController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView = UITableView(frame:CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height - 64) , style: .plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorInset = .zero
        tableView.register(JJSnapKitCell.classForCoder(), forCellReuseIdentifier: "cellId")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        view.addSubview(tableView)
    }
    
    lazy var datas: Array = { () -> Array<JJSnapKitModel> in

        let filePath = Bundle.main.path(forResource: "JJSnapKitDatas.plist", ofType: nil)
        let tempArr = NSArray(contentsOfFile: filePath!)
        let arr = tempArr as! Array<Any>
        
        var models = [JJSnapKitModel]()
        for dict in arr{
           let model = JJSnapKitModel(dict: dict as! [String : Any])
           models.append(model)
        }
        return models
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: JJSnapKitCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! JJSnapKitCell
        let model: JJSnapKitModel = self.datas[indexPath.row] 
        cell.model = model
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        datas[indexPath.row].isExpand = !datas[indexPath.row].isExpand
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }

}

class JJSnapKitCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let contentLabel = UILabel()
    
    var model:JJSnapKitModel! {
        didSet{
            titleLabel.text = model.title
            authorLabel.text = model.author
            contentLabel.numberOfLines = model.isExpand ? 0 : 3
            contentLabel.text = model.content
            
            layoutIfNeeded()
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.backgroundColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 15.0)
        titleLabel.textColor = .black
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.centerX.equalTo(contentView)
        }
        
        authorLabel.backgroundColor = .white
        authorLabel.font = UIFont.systemFont(ofSize: 14.0)
        authorLabel.textColor = UIColor.darkGray
        contentView.addSubview(authorLabel)
        authorLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        contentLabel.backgroundColor = .white
        contentLabel.font = UIFont.systemFont(ofSize: 14.0)
        contentLabel.textColor = .black
        contentLabel.numberOfLines = 3
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorLabel.snp.bottom).offset(2)
            make.leading.equalTo(12)
            make.bottom.trailing.equalTo(-12)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
