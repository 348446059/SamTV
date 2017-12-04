//
//  EmoticonViewCell.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class EmoticonViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    var emoticon : Emoticon?{
        didSet{
            
            iconImageView.image = UIImage(named: (emoticon?.emoticonName)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
