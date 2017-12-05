//
//  RankViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/5.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class RankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pageRect = CGRect(x: 0, y: 20, width: KScreenW, height: KScreenH - 20)
        let titles = ["明星榜", "富豪榜", "人气榜", "周星榜"]
        
        let style = HYTitleStyle()
        style.normalColor = UIColor(r: 255, g: 255, b: 255)
        style.isScrollEnable = false
        style.isShowBottomLine = true
        
        var childVcs = [UIViewController]()
        
        for i in 0..<titles.count {
            let vc :SubrankViewController = i == 3 ? 
            WeekrankViewController() : NormalRankViewController()
            vc.currentIndex = i
            childVcs.append(vc)
        }
        
        let pageView = HYPageView(frame: pageRect, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        view.addSubview(pageView)
        
        
        
        
        
        
        
    }
}
