//
//  NormalRankViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/5.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class NormalRankViewController: SubrankViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupSubrankUI(["日榜", "周榜", "月榜", "总榜"])
    }
}
