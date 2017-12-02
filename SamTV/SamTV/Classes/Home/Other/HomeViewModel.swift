//
//  HomeViewModel.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class HomeViewModel {
    lazy var anchorModels = [AnchorModel]()

}


extension HomeViewModel{
    func loadHomeData(type: HomeType,index:Int,finishedCallback:@escaping()->Void)  {
        NetworkTools.requestData(.get, urlStr: "http://qf.56.com/home/v4/moreAnchor.ios", paramsters: ["type" : type.type, "index" : index, "size" : 48]) { (result) in
            
            guard let resultDict = result as? [String:Any]else{ return }
            guard let messageDict = resultDict["message"] as? [String: Any] else{ return }
            guard let dataArray = messageDict["anchors"] as? [[String
                :Any]] else{ return }
            
            for(index,dict) in dataArray.enumerated(){
                let anchor = AnchorModel(dict: dict)
                anchor.isEvenIndex = index % 2 == 0
                self.anchorModels.append(anchor)
            }
            finishedCallback()
            
        }
    }
    
    
}

































































