//
//  JJChartsCell.swift
//  MySwift
//
//  Created by itclimb on 28/03/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

import UIKit

class JJChartsCell: UICollectionViewCell {
    var item_width: CGFloat?
    let screen_width = UIScreen.width
    var imgView: UIImageView?
    var titleLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        item_width = self.contentView.width
        let margin: CGFloat = 15
        let imgView_width = item_width! - 2 * margin
        let imgView_height = imgView_width
        let imgView_X = margin
        imgView = UIImageView(frame: CGRect(x: imgView_X, y: 0, width: imgView_width, height: imgView_height))
        imgView?.layer.masksToBounds = true
        imgView?.layer.cornerRadius = (imgView?.width)!/2
        self.contentView.addSubview(imgView!)
        
        let title_X: CGFloat = margin
        let title_Y = imgView_height + 5
        let title_width = item_width! - 2 * margin
        let title_height: CGFloat = 21
        titleLabel = UILabel(frame: CGRect(x: title_X, y: title_Y, width: title_width, height: title_height))
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 0
        titleLabel?.backgroundColor = UIColor.purple
        titleLabel?.layer.masksToBounds = true
        titleLabel?.layer.cornerRadius = 5
        titleLabel?.layer.borderWidth = 1
        titleLabel?.layer.borderColor = UIColor.blue.cgColor
        self.contentView.addSubview(titleLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
