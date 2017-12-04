//
//  GiftPackage.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class GiftPackage: BaseModel {
    @objc var t : Int = 8
    @objc var title : String = ""
    @objc var list : [GiftModel] = [GiftModel]()
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "list"{
            if let listArray = value as? [[String : Any]] {
                for dict in listArray{
                    list.append(GiftModel(dict: dict))
                }
            }
        }else{
            super.setValue(value, forKey: key)
        }
    }
}

















































