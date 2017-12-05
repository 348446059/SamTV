//
//  SubrankViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/5.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class SubrankViewController: UIViewController {
 fileprivate var typeName : String = ""
    var currentIndex:Int = 0{
        didSet{
            switch currentIndex {
            case 0:
                typeName = "rankStar"
            case 1:
                typeName = "rankWealth"
            case 2:
                typeName = "rankPopularity"
            case 3:
                typeName = "rankAll"
            default:
                 print("错误类型")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SubrankViewController{
    
    func setupSubrankUI(_ titles: [String])  {
        let pageRect = CGRect(x: 0, y: 0, width: KScreenW, height: KScreenH - 64 - 44)
        let style = HYTitleStyle()
        style.normalColor = UIColor(r: 0, g: 0, b: 0)
        style.isScrollEnable = false
        style.titleHeight = 35
        style.titleBgColor = .white
        
        var childs = [DetailRankViewController]()
        
        for i in 0..<titles.count {
            let rankType = RankType(typeName: typeName, typeNum: i + 1)
            let vc = currentIndex != 3 ? DetailRankViewController(rankType: rankType) :
                WeeklyRankViewController(rankType : rankType)
            childs.append(vc)
        }
        
        let pageView = HYPageView(frame: pageRect, titles: titles, style: style, childVcs: childs, parentVc: self)
        view.addSubview(pageView)
        
        
        
        
    }
}

























































