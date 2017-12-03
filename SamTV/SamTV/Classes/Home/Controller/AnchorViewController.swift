//
//  AnchorViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/2.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
private let KEdgeMargin:CGFloat = 8
private let KAnchorCellID = "KAnchorCellID"
class AnchorViewController: UIViewController {

    //MARK:对外属性
    var homeType :HomeType!
    
    //MARK:定义属性
    fileprivate  lazy var homeVM = HomeViewModel()
    fileprivate  lazy var collectionView : UICollectionView = {
        let layout = WaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: KEdgeMargin, left: KEdgeMargin, bottom: KEdgeMargin, right: KEdgeMargin)
        layout.minimumLineSpacing = KEdgeMargin
        layout.minimumInteritemSpacing = KEdgeMargin
        layout.dataSource = self
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: KAnchorCellID)
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
        loadData(index: 0)
    }

}

extension AnchorViewController{
    
    fileprivate func setupUI(){
        view.addSubview(collectionView)
    }
    fileprivate func loadData(index: Int){
        homeVM.loadHomeData(type: homeType, index: index) {
            self.collectionView.reloadData()
        }
    }
    
}



extension AnchorViewController :WaterfallLayoutDataSource{
    func waterfalllayout(_ layout: WaterfallLayout, indexPath: IndexPath) -> CGFloat {
        return indexPath.item % 2 == 0 ? KScreenW * 2/3 : KScreenW * 0.5
    }
    
    
}

extension AnchorViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.anchorModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KAnchorCellID, for: indexPath) as! HomeViewCell
        
        cell.anchorModel = homeVM.anchorModels[indexPath.item]
        
        if indexPath.item == homeVM.anchorModels.count - 1 {
            loadData(index: homeVM.anchorModels.count)
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let roomVC = RoomViewController()
        roomVC.anchor = homeVM.anchorModels[indexPath.item]
        navigationController?.pushViewController(roomVC, animated: true)
        
    }
}






















































