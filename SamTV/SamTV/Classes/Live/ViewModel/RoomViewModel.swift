//
//  RoomViewModel.swift
//  SamTV
//
//  Created by libo on 2017/12/3.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class RoomviewModel: NSObject {
    lazy var liveURL: String = ""
}

extension RoomviewModel{
    func loadLiveURL(_ roomid:Int,_ userId:String,_ completion:@escaping ()->Void)  {
        let urlString = "http://qf.56.com/play/v2/preLoading.ios"
        let parameters :[String:Any] = ["imei" : "36301BB0-8BBA-48B0-91F5-33F1517FA056",
                                        "roomId" : roomid,
                                        "signature" : "f69f4d7d2feb3840f9294179cbcb913f",
                                        "userId" : userId]
        
        NetworkTools.requestData(.get, urlStr: urlString, paramsters: parameters) { (result) in
            // 1.获取结果字典
            guard let resultDict = result as? [String : Any] else { return }
            
            // 2.获取信息
            guard let msgDict = resultDict["message"] as? [String : Any] else { return }
            
            // 3.获取直播的请求地址
            guard let requestURL = msgDict["rUrl"] as? String else { return }
            
            print(msgDict["rUrl"])
            //4.请求直播地址
            self.loadOnliveURL(requestURL, completion)
            
        }
        
        
    }
    
    
    fileprivate func loadOnliveURL(_ URLString:String,_ complection: @escaping ()->Void){
        NetworkTools.requestData(.get, urlStr: URLString) { (result) in
            // 1.获取结果字典
            guard let resultDict = result as? [String : Any] else { return }
            
            // 2.获取地址
            guard let liveURL = resultDict["url"] as? String else { return }
            
            // 3.保存地址
            self.liveURL = liveURL
            
            //4.回调回去
            complection()
        }
    }
}












































