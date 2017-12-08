//
//  DiscoverContentViewModel.swift
//  SamTV
//
//  Created by libo on 2017/12/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class DiscoverContentViewModel: HomeViewModel {
    
}
extension DiscoverContentViewModel{
    func loadContentData(_ complection:@escaping ()->Void)  {
        NetworkTools.requestData(.get, urlStr: "http://qf.56.com/home/v4/guess.ios", paramsters: ["count" : 27]) { (result) in
            
            // 1.转成字典
            guard let resultDict = result as? [String : Any] else { return }
            
            // 2.取出内容
            guard let msgDict = resultDict["message"] as? [String : Any] else { return }
            
            // 3.取出内容
            guard let dataArray = msgDict["anchors"] as? [[String : Any]] else { return }
            
            
            //4.专程模型对象
            for dict in dataArray{
                self.anchorModels.append(AnchorModel(dict: dict))
            }
            
            complection()
            
        }
    }
}





























