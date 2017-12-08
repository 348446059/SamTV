//
//  CarouselViewModel.swift
//  SamTV
//
//  Created by libo on 2017/12/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class CarouselViewModel{
    
    lazy var carousels = [CarouselModel]()
}


extension CarouselViewModel{
    
    func loadcarouselData(_ completion: @escaping () ->Void){
        NetworkTools.requestData(.get, urlStr: "http://qf.56.com/home/v4/getBanners.ios") { (result) in
            
            
            //1.专程字典
            guard let resultDict = result as? [String : Any] else{ return }
            
            //2.根据message取出数据
            guard let msgDict = resultDict["message"] as? [String:Any] else { return }
            
            //3.根据banners取出数据
            guard let banners = msgDict["banners"] as? [[String:Any]] else { return }
            
            //4.转成模型
            for dict in banners{
                self.carousels.append(CarouselModel(dict: dict))
            }
            
            //5.回调
            completion()
        }
    }
    
}


















