//
//  NetworkTools.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case get
    case post
}
class NetworkTools {
    class func requestData(_ type:MethodType,urlStr:String,paramsters:[String:Any]? = nil,finishedCallback:@escaping (_ result:Any)->Void) {
        //1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        //2.发送网络请求
        Alamofire.request(urlStr, method: method, parameters: paramsters).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            //将结果回调回去
            finishedCallback(result)
        }
        
    }
}
