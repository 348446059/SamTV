//
//  MainViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC("Home")
        addChildVC("Rank")
        addChildVC("Discover")
        addChildVC("Profile")
    }

    func addChildVC(_ storyName:String)  {
        // 1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        // 2.将childVc作为子控制器
        addChildViewController(childVc)
        
    }

}
