//
//  MoreInfoView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class MoreInfoView: UIView ,NIbLoadable{

   class   func loadMoreInfoView() -> MoreInfoView {
        return MoreInfoView.loadfromNib()
    }

}
