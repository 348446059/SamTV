//
//  SamNavigationController.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class SamNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //1.运行时，打印手势中所有的属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey: "_targets") as? [NSObject] else {
            return
        }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }



    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }

}
