//
//  GiftViewModel.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class GiftViewModel {
    static let shareInstance  = GiftViewModel()
    lazy var giftlistData : [GiftPackage] = [GiftPackage]()
    
}

extension GiftViewModel{
    func loadGiftData(finishedCallback: @escaping ()-> Void) {
        if giftlistData.count != 0 {
            finishedCallback()
        }
        
        
        NetworkTools.requestData(.get, urlStr: "http://qf.56.com/pay/v4/giftList.ios", paramsters: ["type" : 0, "page" : 1, "rows" : 150]) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            
            guard let dataDict = resultDict["message"] as? [String : Any] else { return }
            
            for i in 0..<dataDict.count{
                guard let dict = dataDict["type\(i+1)"] as? [String:Any] else { continue }
                self.giftlistData.append(GiftPackage(dict: dict))
            }
            self.giftlistData = self.giftlistData.filter({return $0.t != 0 }).sorted(by: {return $0.t > $1.t})
            
            finishedCallback()
        }
    }
}




















