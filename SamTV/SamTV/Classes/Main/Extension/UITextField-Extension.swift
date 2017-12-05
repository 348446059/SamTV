//
//  UITextField-Extension.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

extension UITextField{
    func setlectedRange() -> NSRange {
        let begin = beginningOfDocument
        let textRange = selectedTextRange!
        
        let start = textRange.start
        let end = textRange.end
        
        let location = offset(from: begin, to: start)
        let length = offset(from: start, to: end)
        
        return NSMakeRange(location, length)
        
        
        
    }
}
