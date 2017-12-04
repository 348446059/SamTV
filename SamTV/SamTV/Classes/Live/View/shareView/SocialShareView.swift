//
//  SocialShareView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class SocialShareView: UIView ,NIbLoadable{
    
    @IBOutlet var shareBtns: [MoreInfoButton]!
    
    

    @IBAction func shareBtnClick(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = "abc"
        
    }
    
    
}

extension SocialShareView{
   class func loadSocialShareView() -> SocialShareView {
        return SocialShareView.loadfromNib()
    }
    
    func showShareView()  {
        //1.改变btn位置
        for btn in shareBtns {
            btn.transform = CGAffineTransform(translationX: 0, y: 200)
            
        }
        //2.恢复位置
        for (index,btn) in shareBtns.enumerated() {
            UIView.animate(withDuration: 0.5, delay: 0.25 + Double(index) * 0.02, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
                btn.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
}








































































