//
//  AnimManager.swift
//  SamTV
//
//  Created by libo on 2017/12/3.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class AnimManager {
    
    static let shareInstance = AnimManager()
    
    fileprivate lazy var granuleLayer : CAEmitterLayer = {
        //1.创建粒子动画
        let emitterLayer = CAEmitterLayer()
        
        //2.发射器在xy平面的中心位置
        emitterLayer.emitterPosition = CGPoint(x: 335, y: 637)
        
        //3.发射器的尺寸大小
        emitterLayer.emitterSize = CGSize(width: 20, height: 20)
        
        //4.设置渲染模式
        emitterLayer.renderMode = kCAEmitterLayerUnordered
        
        //5.开启三维效果
        emitterLayer.preservesDepth = true
        
        //6.创建粒子
        var array  = [CAEmitterCell]()
        
        for i in 0..<10 {
            let cell = CAEmitterCell()
            cell.birthRate = 1
            cell.lifetime = Float(arc4random_uniform(4) + 1)
            cell.lifetimeRange = 1.5
            
            let image = UIImage.init(named: "good\(i)_30x30")
            cell.contents = image?.cgImage
            cell.velocity = CGFloat(arc4random_uniform(100) + 100)
            cell.velocityRange = 80
            cell.emissionLongitude = CGFloat(Double.pi + Double.pi/2)
            cell.emissionRange = CGFloat(Double.pi/12)
            cell.scale = 0.7
            array.append(cell)
            
      }
        // 7.设置粒子
        emitterLayer.emitterCells = array
        
        return emitterLayer
    }()
    
}


extension AnimManager{
    func addGranuleAnim(view:UIView)  {
        view.layer.addSublayer(granuleLayer)
    }
    
    func removeGranuleAnim()  {
        granuleLayer.removeFromSuperlayer()
    }
}




























































