//
//  JJHomeController.swift
//  MySwift
//
//  Created by itclimb on 2017/3/10.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJHomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(list)
    
        test(parameter1: 30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - lazy load
    lazy var list: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        return tableView
    }()
    
    lazy var datas: NSArray = {
        let pathFile:String = Bundle.main.path(forResource: "JJControllers.plist", ofType: nil)!
        let arr = NSArray.init(contentsOfFile: pathFile)
        var arrM: NSMutableArray = NSMutableArray.init(capacity: (arr?.count)!)
        arr?.enumerateObjects({ (obj, index, stop) in
            let model = JJControllerModel.init(dict: obj as! [String : Any])
            arrM.add(model)
        })
        return arrM
    }()

}

/**
 * UITableViewDataSource,UITableViewDelegate
 */
extension JJHomeController: UITableViewDataSource,UITableViewDelegate{

    @available(iOS 2.0, *)
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ID = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID) as? JJHomeCell
        if cell == nil {
            cell = JJHomeCell(style: .default, reuseIdentifier: ID)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell: JJHomeCell = cell as! JJHomeCell
        let data:JJControllerModel = self.datas[indexPath.row] as! JJControllerModel
        cell.firstTitle.text = data.vcTitle
        cell.firstTitle.backgroundColor = UIColor.colorWithHexString(hex: data.cellColor!);
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = JJByValueController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = JJChartsController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = RadarChartViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = JJAutoLayoutController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = JJOverlayViewController() //覆盖图
            self.navigationController?.pushViewController(vc, animated: true)

        default: break
            
        }
    }
}

//富文本展示
func formatRichText(value: String) -> NSMutableAttributedString {
    let signValue = "元"
    let signLength = signValue.lengthOfBytes(using: .utf16)
    let valueLength = value.lengthOfBytes(using: .utf8)
    let valueAttri = NSMutableAttributedString(string: value + "元")
    valueAttri.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(0, valueLength))
    valueAttri.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSMakeRange(valueLength, signLength - 1))
    valueAttri.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 20), range: NSMakeRange(valueLength, signLength - 1))

    return valueAttri
}

//MARK:格式化数字显示
func formatShowNumber(value:String) -> String {
    if value.isEmpty {
        return "0"
    }
    //保留位数
    let interceptValue = String(format: "%.2f", (value as NSString).doubleValue)
    //添加分隔符
    let format = NumberFormatter()
    format.numberStyle = .decimal
    let formatValue = format.string(from: NSNumber(value: (interceptValue as NSString).doubleValue))
    return formatValue!
}

func kexihua(_ adder: Int) -> (Int) -> Int {
    return{
        num in
        return num + adder
    }
}

func greater(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer}
}

//MARK: - Test

/**
 //    let greaterThan10 = greater(10)
 //    print(greaterThan10(13))
 //    print(greaterThan10(9))
 */
func test(parameter1: CGFloat, parameter2: CGFloat = 0) {
    print("----",parameter1)
}

//func test(parameter1: CGFloat) {
//    print("=====",parameter1)
//    
//}

//MARK: - 版本检测
func versionCheck(){
    
    let infoDictionary = Bundle.main.infoDictionary
    //app名称
    let _: Any? = infoDictionary!["CFBundleDisplayName"] as Any
    //主版本号
    let majorVersion : Any? = infoDictionary! ["CFBundleShortVersionString"] as Any
    //版本号(内部标识)
    let _ : Any? = infoDictionary! ["CFBundleVersion"] as Any
    let appVersion = majorVersion as! String
    print(appVersion)
    //ios 版本
    let _ : NSString = UIDevice.current.systemVersion as NSString
    //设备 udid
    _ = UIDevice.current.identifierForVendor
    //设备名称
    _ = UIDevice.current.systemName
    //设备型号
    _ = UIDevice.current.model
    //设备区域化型号 如 A1533
    _ = UIDevice.current.localizedModel
}

fileprivate class JJHomeCell: UITableViewCell {
    
    var firstTitle: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        firstTitle = UILabel()
        firstTitle.textColor = UIColor.white
        firstTitle.backgroundColor = UIColor.brown
        firstTitle.textAlignment = .center
        firstTitle.font = UIFont(name: "", size: 20.0)//Apple SD Gothic Neo
        firstTitle.layer.masksToBounds = true
        firstTitle.layer.cornerRadius = 5
        contentView.addSubview(firstTitle)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        firstTitle.size = CGSize(width: 222, height: 40)
        firstTitle.bottom = contentView.bottom
        firstTitle.centerX = contentView.centerX
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
