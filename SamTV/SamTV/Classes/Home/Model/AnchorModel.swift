//
//  AnchorModel.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class AnchorModel: BaseModel {
 @objc   var roomid : Int = 0
 @objc   var name : String = ""
 @objc   var pic51 : String = ""
 @objc   var pic74 : String = ""
 @objc   var live : Int = 0 // 是否在直播
 @objc   var push : Int = 0 // 直播显示方式
 @objc   var focus : Int = 0 // 关注数
    
 @objc   var uid : String = ""
    
 @objc   var isEvenIndex : Bool = false
}
