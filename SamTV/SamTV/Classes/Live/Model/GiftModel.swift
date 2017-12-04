//
//  GiftModel.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class GiftModel: BaseModel {
    @objc var img2: String = ""
    @objc var coin:Int = 0
    @objc var subject:String = ""{
        didSet{
            if subject.contains("(有声)") {
                subject = subject.replacingOccurrences(of: "(有声)", with: "")
            }
        }
    }
}
