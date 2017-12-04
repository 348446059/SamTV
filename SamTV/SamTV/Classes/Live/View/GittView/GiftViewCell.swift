//
//  GiftViewCell.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class GiftViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var giftModel : GiftModel?{
        didSet{
            
            iconImageView.kf.setImage(with: URL(string: (giftModel?.img2)!), placeholder: #imageLiteral(resourceName: "room_btn_gift"))
            subjectLabel.text = giftModel?.subject
            priceLabel.text = "\(giftModel?.coin ?? 0)"
            
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView()
        selectedView.layer.cornerRadius = 5
        selectedView.layer.masksToBounds = true
        selectedView.layer.borderWidth = 1
        selectedView.layer.borderColor = UIColor.orange.cgColor
        selectedView.backgroundColor = UIColor.black
        selectedBackgroundView = selectedView
    }

}














