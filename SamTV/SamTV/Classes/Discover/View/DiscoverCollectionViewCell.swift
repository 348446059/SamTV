//
//  DiscoverCollectionViewCell.swift
//  SamTV
//
//  Created by libo on 2017/12/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class DiscoverCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var onlineLabel: UILabel!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var liveImageView: UIImageView!
    
    var anchor:AnchorModel? {
        didSet{
            guard let anchor = anchor else {
                return
            }
            
            onlineLabel.text = "\(anchor.focus)人观看"
            nickNameLabel.text = anchor.name
            
            iconImageView.kf.setImage(with: URL(string: anchor.pic51))
            liveImageView.isHidden = anchor.live == 0
        }
    }
    
    
}
