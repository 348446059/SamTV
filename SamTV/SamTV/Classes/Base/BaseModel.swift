//
//  BaseModel.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
class BaseModel: NSObject {
    override init() {
        
    }
    
    init(dict: [String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
