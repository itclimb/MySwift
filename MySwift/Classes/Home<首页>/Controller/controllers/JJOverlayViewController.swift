//
//  JJOverlayViewController.swift
//  MySwift
//
//  Created by itclimb on 14/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJOverlayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, OverlayControllerDelegate, SnailFullViewDelegate {
    
    var datas: Array<Any>!
    
    private var overlayController : OverlayController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        datas = ["标语", "提示框", "分享", "QQ_zone", "侧边栏", "缓慢移动"]
        view.addSubview(tableView)
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "Identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = datas[indexPath.row] as? String
        cell?.separatorInset = .zero
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            sample0()
        case 1:
            sample1()
        case 2:
            sample2()
        case 3:
            sample3()
        case 4:
            sample4()
        case 5:
            sample5()
        default: break
        }
    }
    
    func sample0() {
        let sloganView = UIImageView(image: UIImage(named: "slogan.jpg"))
        sloganView.size = CGSize(width: UIScreen.width * 0.75, height: UIScreen.width * 0.9)
        sloganView.layer.cornerRadius = 4
        overlayController = OverlayController(aView: sloganView, overlayStyle: .BlackTranslucent)
        overlayController.transitionStyle = .FromLeft
        overlayController.isUsingElastic = true
        overlayController.present(animated: true)
    }
    
    func sample1() {
        let warnView = SnailWarnView()
        warnView.width = UIScreen.width * 0.75
        warnView.setWarnContents(title: "提示", message: "切换城市失败，是否重试?", okButtonTitle: "确定", cancelButtonTitle: "取消")
        warnView.component.unifiedColor = UIColor.colorWithHexString(hex: "#FC7541")
        warnView.component.okButton.addTarget(self, action: #selector(okClicked(_:)), for: .touchUpInside)
        warnView.component.cancelButton.addTarget(self, action: #selector(okClicked(_:)), for: .touchUpInside)
        
        overlayController = OverlayController(aView: warnView, overlayStyle: .BlackTranslucent)
        overlayController.transitionStyle = .FromTop
        overlayController.isAllowOverlayTouch = false
        overlayController.isDismissedOppositeDirection = true
        overlayController.isUsingElastic = true
        overlayController.present(animated: true)
    }
    
    func sample2() {
        let array = [
            "微信好友", "朋友圈", "新浪微博", "QQ好友", "跳转"
        ]
        let size = CGSize(width: 60, height: 80)
        let sheetView = sheetFast(itemSize: size, hasClose: true, items: array, prefixName: "shared_")
        sheetView.height += 45;
        
        overlayController = OverlayController(aView: sheetView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Bottom
        overlayController.isAllowDrag = true
        overlayController.isUsingElastic = true
//        overlayController.delegate = self
        overlayController.present(animated: true)
    }
    
    func sample3() {
        let array = [
            "说说", "照片", "视频", "签到", "大头贴"
        ]
        let size = CGSize(width: 65, height: 90)
        let qzoneView = sheetFast(itemSize: size, hasClose: false, items: array, prefixName: "qzone_")
        qzoneView.closeClosure = {(anyObj : AnyObject) -> Void in self.dismiss() }
        qzoneView.close.setImage(UIImage(named: "qzone_关闭"), for: .normal)
        
        overlayController = OverlayController(aView: qzoneView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Top
        overlayController.present(animated: true)
    }
    
    func sample4() {
        let sidebarView = SnailSidebarView()
        sidebarView.size = CGSize(width: UIScreen.width - 70, height: UIScreen.height)
        sidebarView.backgroundColor = UIColor.rgb(r: 24, g: 28, b: 45).withAlphaComponent(0.8)
        sidebarView.setItems(items: ["我的故事", "消息中心", "我的收藏", "近期阅读", "离线阅读"])
        
        overlayController = OverlayController(aView: sidebarView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Left
        overlayController.isAllowDrag = true
        overlayController.present(animated: true)
    }
    
    func sample5() {
        let array = [
            "文字", "照片视频", "头条文章", "红包", "直播", "更多", "点评", "好友圈", "音乐", "商品", "签到", "秒拍"
        ]
        var items: [BannerItem] = []
        for (_, name) in array.enumerated(){
            let item = BannerItem()
            item.title = name
            if let img = UIImage(named: "sina_".appending(name)) { item.image = img }
            items.append(item)
        }
        let fullView = SnailFullView()
        fullView.items = items
        fullView.size = UIScreen.size
        fullView.delegate = self
        
        overlayController = OverlayController(aView: fullView, overlayStyle: .WhiteBlur)
        overlayController.isAllowDrag = true
        overlayController.present(animated: true)
    }
    
    // MARK: - OverlayControllerDelegate
    
    func overlayControllerWillPresent(overlayController: OverlayController) {
        print("overlayControllerWillPresent~")
    }
    
    func overlayControllerDidPresent(overlayController: OverlayController) {
        print("overlayControllerDidPresent~")
    }
    
    func overlayControllerWillDismiss(overlayController: OverlayController) {
        print("overlayControllerWillDismiss~")
    }
    
    func overlayControllerDidDismiss(overlayController: OverlayController) {
        print("overlayControllerDidDismiss~")
    }
    
    //MARK: - SnailFullViewDelegate
    
    func fullView(whenTapped fullView: SnailFullView) {
        dismiss()
    }
    
    func fullView(_ fullView: SnailFullView, didSelectItemAt index: Int) {
        overlayController.dismiss(animated: true) { [weak self] (overlayController: OverlayController) in
            let text = fullView.bannerViews[index].label.text!
            self?.showAlert(title: text)
        }
    }
    
    func okClicked(_ sender: UIButton) {
        dismiss()
    }
    
    func dismiss() {
        overlayController.dismiss(animated: true)
    }
    
    func sheetFast(itemSize: CGSize, hasClose: Bool, items array: Array<String>, prefixName: String) -> SnailSheetView {
        var items: [BannerItem] = []
        for (_, name) in array.enumerated() {
            let item = BannerItem()
            item.title = name
            if let img = UIImage(named: prefixName.appending(name)) { item.image = img }
            items.append(item)
        }
        let sheet = SnailSheetView()
        sheet.width = UIScreen.width
        sheet.items = items
        sheet.close.isHidden = hasClose
        sheet.bannerTouchClosure = {(anyObj: Any, index: Int) -> Void in
            let sheetView = anyObj as! SnailSheetView
            if let text = sheetView.bannerViews[index].label.text { print(text) }
        }
        return sheet
    }
    
    func showAlert(title text: String) {
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
