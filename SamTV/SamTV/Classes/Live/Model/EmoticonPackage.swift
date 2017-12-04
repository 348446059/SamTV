//
//  EmoticonPackage.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class EmoticonPackage {
 
    lazy var emoticons = [Emoticon]()
    
    init(plistName:String) {
        guard  let path = Bundle.main.path(forResource: plistName, ofType: nil) else {
            return
        }
       
        guard let emoticonArray =  NSArray(contentsOfFile: path) as? [String] else {
            return
        }
        
        for str in emoticonArray{
            emoticons.append(Emoticon(emoticon: str))
        }
    }
    
}
