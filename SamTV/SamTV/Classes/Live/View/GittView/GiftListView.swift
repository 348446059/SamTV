//
//  GiftListView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
private let KGiftCellID = "KGiftCellID"

protocol GiftListViewDelegate: class{
    func giftListView(giftView:GiftListView,giftModel:GiftModel)
}
class GiftListView: UIView,NIbLoadable {

    @IBOutlet weak var giftView: UIView!
    @IBOutlet weak var sendGiftBtn: UIButton!
    
    fileprivate var pageCollectionView :HYPageCollectionView!
    fileprivate var currentIndexPath:IndexPath?
    
    weak var deleagte : GiftListViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //1.初始化礼物的view
        initUI()
        
        //2.加载数据
        loadGiftData()
    }
    
    @IBAction func sendGiftBtnClick(_ sender: Any) {
        
        let package = GiftViewModel.shareInstance.giftlistData[currentIndexPath!.section]
        let giftModel = package.list[currentIndexPath!.item]
        deleagte?.giftListView(giftView: self, giftModel: giftModel)
        
        
    }
    
    
    
}

extension GiftListView{
    
   class func loadGiftListView() -> GiftListView {
        return GiftListView.loadfromNib()
    }
}

extension GiftListView{
    
    fileprivate func initUI(){
        let style = HYTitleStyle()
        style.isScrollEnable = false
        style.isShowBottomLine = true
        style.normalColor = UIColor(r: 255, g: 255, b: 255)
        
        let layout = HYPageCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.cols = 4
        layout.rows = 2
        
        var pageViewFrame = giftView.bounds
        pageViewFrame.size.width = KScreenW
        pageCollectionView = HYPageCollectionView(frame: pageViewFrame, titles:["热门", "高级", "豪华", "专属"], style: style, isTitleInTop: true, layout: layout)
        giftView.addSubview(pageCollectionView)
        
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        
        pageCollectionView.register(nib: UINib(nibName: "GiftViewCell", bundle: nil), identifier: KGiftCellID)
        
        
    }
}


//MARK:-加载数据
extension GiftListView{
  fileprivate  func loadGiftData()  {
    GiftViewModel.shareInstance.loadGiftData {
        self.pageCollectionView.reloadData()
    }
    }
}




//MARK:-代理
extension GiftListView:HYPageCollectionViewDelegate,HYPageCollectionViewDataSource{
    
    func pageCollectionView(_ pageCollectionView: HYPageCollectionView, didSelectItemAt indexPath: IndexPath) {
       currentIndexPath = indexPath
        sendGiftBtn.isEnabled = true
    }
    
    func numberOfSections(in pageCollectionView: HYPageCollectionView) -> Int {
        return GiftViewModel.shareInstance.giftlistData.count
    }
    
    func pageCollectionView(_ collectionView: HYPageCollectionView, numberOfItemsInSection section: Int) -> Int {
        let package = GiftViewModel.shareInstance.giftlistData[section]
        return package.list.count
    }
    
    func pageCollectionView(_ pageCollectionView: HYPageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KGiftCellID, for: indexPath) as! GiftViewCell
        let package = GiftViewModel.shareInstance.giftlistData[indexPath.section]
        cell.giftModel = package.list[indexPath.item]
        
        return cell
    }
    
    
    
    
}























