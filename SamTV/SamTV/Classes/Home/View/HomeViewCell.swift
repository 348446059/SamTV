//
//  HomeViewCell.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
import Kingfisher
class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var liveImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var onlinePeopleLabel: UIButton!
    
    //MARK:定义属性
    var anchorModel :AnchorModel?{
        didSet{
            let urlStr = anchorModel!.isEvenIndex ? anchorModel?.pic74 : anchorModel?.pic51
            albumImageView.kf.setImage(with: URL(string: urlStr!))
            liveImageView.isHidden = anchorModel?.live == 0
            nicknameLabel.text = anchorModel?.name
            onlinePeopleLabel.setTitle("\(anchorModel?.focus ?? 0)", for: .normal)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
