//
//  CustomCell.swift
//  BangocBooks
//
//  Created by Ngoc on 9/23/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit
let kCellWidth: CGFloat = 203
let kCellHeigh: CGFloat = 274
let kLabelHeight: CGFloat = 80

class CustomCell: UICollectionViewCell {
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(kCellWidth, kCellHeigh + kLabelHeight)
    }
    
    
    func addSubViews(){
        if(imageView == nil){
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kCellHeigh))
            imageView.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imageView)
        }
        
        if(label == nil){
            label = UILabel(frame: CGRectMake(0, kCellHeigh, kCellWidth, kLabelHeight))
            label.textAlignment = .Center
            label.textColor = UIColor(white: 0.9, alpha: 1.0)
            label.highlightedTextColor = tintColor
            label.font = UIFont.systemFontOfSize(20)
            //label.lineBreakMode = NSLineBreakMode.ByWordWrapping
            label.numberOfLines = 3
            contentView.addSubview(label)
        }
    
    }
    
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth = selected ? 2 : 0
        }
    }
}
