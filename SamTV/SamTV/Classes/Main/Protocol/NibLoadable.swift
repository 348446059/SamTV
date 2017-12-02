//
//  NibLoadable.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

protocol NIbLoadable {
    
}

extension NIbLoadable where Self :UIView{
    static func loadfromNib(_ nibname:String? = nil)->Self{
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
        
    }
}

