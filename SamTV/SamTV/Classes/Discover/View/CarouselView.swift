//
//  CarouselView.swift
//  SamTV
//
//  Created by libo on 2017/12/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

private let kCarouselViewCellID = "kCarouselViewCellID"


class CarouselView: UIView,NIbLoadable {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    fileprivate lazy var carouselVM = CarouselViewModel()
    fileprivate var updateTimer :Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(kCarouselViewCell.self, forCellWithReuseIdentifier: kCarouselViewCellID)
        
        addTimer()
        
        carouselVM.loadcarouselData {
            self.collectionView.reloadData()
            
            self.pageControl.numberOfPages = self.carouselVM.carousels.count
            
            let startIndexPath = IndexPath(item: self.carouselVM.carousels.count * 100, section: 0)
            
            self.collectionView.scrollToItem(at: startIndexPath, at: .left, animated: false)
            
        }
    }
    
}


extension CarouselView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselVM.carousels.count * 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCarouselViewCellID, for: indexPath) as! kCarouselViewCell
        cell.carouselModel = carouselVM.carousels[indexPath.row % carouselVM.carousels.count]
        
        return cell
        
    }
}

extension CarouselView :UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //1.滚动的距离
        let offsetX = scrollView.contentOffset.x
        
        //2.设置pageControl
        pageControl.currentPage  = Int(offsetX / scrollView.bounds.width) % 4
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addTimer()
    }
    
}












extension CarouselView{
    class func loadCarouseView()->CarouselView{
        return CarouselView.loadfromNib()
    }
}

extension CarouselView{
    fileprivate func addTimer(){
        updateTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(updateTimer!, forMode: .commonModes)
    }
    
    func removeTimer()  {
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
   @objc private  func scrollToNext()  {
        let offset = collectionView.contentOffset.x + collectionView.bounds.width
        
        collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        
    }
}

class kCarouselViewCell: UICollectionViewCell {
    lazy var imageView = UIImageView()
    
    var carouselModel : CarouselModel?{
        didSet{
            
            imageView.kf.setImage(with: URL(string: (carouselModel?.picUrl)!))
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("fail to init")
    }
    
}


class CarouseViewlayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        itemSize = collectionView!.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        
    }
}

























