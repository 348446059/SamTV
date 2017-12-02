//
//  HomeViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


}

extension HomeViewController{
    
    fileprivate func setupUI(){
      setupNavigationBar()
        setupContentView()
    }
    
    func setupNavigationBar() {
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "home-logo"), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search_btn_follow"), style: .plain, target: nil, action: nil)
        
        let searchFrame = CGRect(x: 0, y: 0, width: 200, height: 32)
        let searchBar = UISearchBar(frame: searchFrame)
        searchBar.placeholder = "主播昵称/房间号/连接"
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = .minimal
        
        let searchFiled = searchBar.value(forKey: "_searchField") as? UITextField
        searchFiled?.textColor = UIColor.white
    }
    
   fileprivate func setupContentView()  {
        //1.获取数据
    let homeTypes = loadTypesData()
    
    //2.创建主题内容
    let style = HYTitleStyle()
    style.isShowCover = true
    style.isScrollEnable = true
    let pageframe = CGRect(x: 0, y: KNavigationBarH + KStatusBarH, width: KScreenW, height: KScreenH - KNavigationBarH - KStatusBarH - 44)
    
    let titles = homeTypes.map({ $0.title })
    var childVCs = [AnchorViewController]()
    
    for type in homeTypes {
        let anchorVC = AnchorViewController()
        anchorVC.homeType = type
        childVCs.append(anchorVC)
        
    }
    
    let pageView = HYPageView(frame: pageframe, titles: titles, style: style, childVcs: childVCs, parentVc: self)
    
    view.addSubview(pageView)
    
    
    }
    fileprivate func loadTypesData() -> [HomeType] {
        let path = Bundle.main.path(forResource: "types.plist", ofType: nil)!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        var tempArray = [HomeType]()
       
        for dict in dataArray {
            tempArray.append(HomeType(dict: dict))
        }
        return tempArray
    }
}




















