//
//  MoreInfoButton.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class MoreInfoButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageView?.contentMode = .scaleAspectFit
        titleLabel?.textAlignment = .center
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let ratio :CGFloat = 0.5
        imageView?.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height * ratio)
        titleLabel?.frame = CGRect(x: 0, y: imageView!.frame.maxY, width: frame.width, height: frame.height * (1 - ratio))
        
        
    }

}















