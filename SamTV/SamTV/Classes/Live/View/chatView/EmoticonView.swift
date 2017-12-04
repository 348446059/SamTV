//
//  EmoticonView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
private let kEmoticonCellID = "kEmoticonCellID"

class EmoticonView: UIView {

    fileprivate var pageCollectionView:HYPageCollectionView!
    
    fileprivate var emoticonClickCallback:(_ emoticon:Emoticon) -> ()
    
    init(frame: CGRect,emoticonClickCallback:@escaping (_ emoticon:Emoticon)->()) {
        self.emoticonClickCallback = emoticonClickCallback
        
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmoticonView{
    
    fileprivate func initUI(){
        backgroundColor = UIColor(white: 0.0, alpha: 0.8)
        
        let titles = ["普通","粉丝专属"]
        let style = HYTitleStyle()
        style.normalColor = UIColor(r: 255, g: 255, b: 255)
        style.isScrollEnable = false
        style.isShowBottomLine = true
        
        let layout = HYPageCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.cols = 7
        layout.rows = 3
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        pageCollectionView = HYPageCollectionView(frame: bounds, titles: titles, style: style, isTitleInTop: false, layout: layout)
        addSubview(pageCollectionView)
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        pageCollectionView.register(nib: UINib(nibName: "EmoticonViewCell", bundle: nil), identifier: kEmoticonCellID)
        
        
        
        
    }
    
    
    
}

extension EmoticonView:HYPageCollectionViewDataSource,HYPageCollectionViewDelegate{
    func numberOfSections(in pageCollectionView: HYPageCollectionView) -> Int {
        return EmoticonViewModel.shareInstance.packages.count
    }
    
    func pageCollectionView(_ collectionView: HYPageCollectionView, numberOfItemsInSection section: Int) -> Int {
        let package = EmoticonViewModel.shareInstance.packages[section]
        return package.emoticons.count
    }
    
    func pageCollectionView(_ pageCollectionView: HYPageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEmoticonCellID, for: indexPath) as! EmoticonViewCell
        
        let package = EmoticonViewModel.shareInstance.packages[indexPath.section]
        
        cell.emoticon = package.emoticons[indexPath.item]
        
        return cell
        
    }
    
    func pageCollectionView(_ pageCollectionView: HYPageCollectionView, didSelectItemAt indexPath: IndexPath) {
        let package = EmoticonViewModel.shareInstance.packages[indexPath.section]
        let emoticon = package.emoticons[indexPath.item]
        
        emoticonClickCallback(emoticon)
        
        
    }
    
    
    
    
    
}





















