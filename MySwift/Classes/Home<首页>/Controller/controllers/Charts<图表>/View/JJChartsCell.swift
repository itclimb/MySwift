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
    let screen_width = UIScreen.main.bounds.size.width
    var imgView: UIImageView?
    var titleLabel: UILabel?
    var readLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        item_width = self.contentView.bounds.width
        let margin: CGFloat = 20
        let imgView_width = item_width! - 2 * margin
        let imgView_height = imgView_width
        let imgView_X = margin
        imgView = UIImageView(frame: CGRect(x: imgView_X, y: 0, width: imgView_width, height: imgView_height))
        self.contentView.addSubview(imgView!)
        let title_X: CGFloat = 0
        let title_Y = imgView_height + 10
        let title_width = item_width
        let title_height: CGFloat = 21
        titleLabel = UILabel(frame: CGRect(x: title_X, y: title_Y, width: title_width!, height: title_height))
        titleLabel?.textAlignment = .center
        titleLabel?.numberOfLines = 0
        self.contentView.addSubview(titleLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
