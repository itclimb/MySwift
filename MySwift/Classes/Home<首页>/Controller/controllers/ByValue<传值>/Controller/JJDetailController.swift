//
//  JJDetailController.swift
//  MySwift
//
//  Created by itclimb on 2017/3/16.
//  Copyright © 2017年 itclimb.yuancheng.com. All rights reserved.
//

import UIKit
import SnapKit

typealias JJDetailSaveClosure = ()->()
class JJDetailController: UIViewController {
    
    var saveClosure : JJDetailSaveClosure?
    
    var nameTF:UITextField?
    var detailTF:UITextField?

    var model: JJDetailModel? {
        didSet{
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        createUI()
        nameTF?.text = model?.title
        detailTF?.text = model?.describe
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

extension JJDetailController{
    func createUI() {
        
        self.title = "修改信息"
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save(_:)))
        self.navigationItem.rightBarButtonItem = save
        
        let magin:CGFloat = 20
        let nameTF_width = UIScreen.main.bounds.size.width - 2 * magin
        let nameTF_height:CGFloat = 40
        nameTF = UITextField(frame: CGRect(x: magin, y: magin, width: nameTF_width, height: nameTF_height))
        nameTF?.borderStyle = UITextBorderStyle.roundedRect
        nameTF?.layer.borderColor =  (UIColor.blue).cgColor
        nameTF?.layer.borderWidth = 0.5
        nameTF?.layer.masksToBounds = true
        view.addSubview(nameTF!)
        
        let detailTF_width = nameTF_width
        let detailTF_height = nameTF_height
        let detailTF_y = 2 * magin + nameTF_height
        detailTF = UITextField(frame: CGRect(x: magin, y: detailTF_y, width: detailTF_width, height: detailTF_height))
        detailTF?.borderStyle = UITextBorderStyle.roundedRect
        detailTF?.layer.borderColor = UIColor.blue.cgColor
        detailTF?.layer.borderWidth = 0.5
        view.addSubview(detailTF!)
        
        let notifiSave = UIButton(type: .custom)
        notifiSave.setTitle("通知保存", for: .normal)
        notifiSave.setTitleColor(.white, for: .normal)
        notifiSave.backgroundColor = UIColor.blue
        notifiSave.layer.masksToBounds = true
        notifiSave.layer.cornerRadius = 3
        view.addSubview(notifiSave)
        notifiSave.snp.makeConstraints { (make) in
            make.top.equalTo((detailTF?.snp.bottom)!).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(40)
        }
        notifiSave.addTarget(self, action: #selector(saveByNotifi(_:)), for: .touchUpInside)
    }
    
    //MARK: - 通知保存
    func saveByNotifi(_ sender: UIButton) {
        let title = self.nameTF?.text
        let describe = self.detailTF?.text
        model?.title = title
        model?.describe = describe
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AuthSuccessNotification"), object: nil)
        navigationController?.popViewController(animated: true)
    }

    //MARK: - 保存
    func save(_ sender: UIBarButtonItem) {
        let title = self.nameTF?.text
        let describe = self.detailTF?.text
        model?.title = title
        model?.describe = describe
        saveClosure!()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func clickSaveButtonWith(_ closure: @escaping JJDetailSaveClosure) {
        saveClosure = closure
    }
}
