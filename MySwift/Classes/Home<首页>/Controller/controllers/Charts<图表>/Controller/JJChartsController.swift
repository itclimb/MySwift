//
//  JJChartsController.swift
//  MySwift
//
//  Created by itclimb on 28/03/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//  Collection controller

import UIKit

class JJChartsController: UIViewController {
    
    var collectionView: UICollectionView?
    var dataArr: [JJDetailModel]?
    var item_width: CGFloat?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
        loadData { (models) in
            self.dataArr = models
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension JJChartsController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //create user interface
    func createUI() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.register(JJChartsCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        
        let column: CGFloat = 3
        let margin: CGFloat = 10
        item_width = (UIScreen.main.bounds.width - (column + 1) * margin)/column
        let item_height = item_width
        layout.itemSize = CGSize(width: item_width!, height: item_height!)
        self.view.addSubview(collectionView!)
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataArr?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! JJChartsCell
        let model = self.dataArr?[indexPath.row]
        cell.imgView?.image = UIImage(named: (model?.iconName)!)
        cell.titleLabel?.text = model?.title
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = JJPieController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case 1:
            let vc = JJBarController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case 2:
            let vc = JJLineController()
            navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
        
    }
    
}

extension JJChartsController {
    func loadData(success: @escaping(_ models: [JJDetailModel]) -> ()) {
        
        var models = [JJDetailModel]()
        for i in 0..<3 {
            let title = "ios\(i)"
            let describe = "show\(i)"
            let iconName = "dog"
            let dict: [String : Any] = [
                "title":title,
                "describe":describe,
                "iconName":iconName
            ]
            let model = JJDetailModel(dict: dict)
            models.append(model)
            success(models)
        }
        
    }
}

