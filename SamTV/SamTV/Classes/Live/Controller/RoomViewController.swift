//
//  RoomViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
import IJKMediaFramework
class RoomViewController: UIViewController,Emitterable {

    
    //MARK:-对外提供属性
    var anchor :AnchorModel?
    
    fileprivate var player:IJKFFMoviePlayerController?
    
    fileprivate lazy var roomVM = RoomviewModel()
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var roomNumberLabel: UILabel!
    
    @IBOutlet weak var onlineNumLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
        loadRoomInfo()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        player?.shutdown()
       
    }

   
}

//MARK:-加载房间信息
extension RoomViewController{
   fileprivate func loadRoomInfo()  {
    if let roomid = anchor?.roomid,let uid = anchor?.uid {
        print(roomid,uid)
        roomVM.loadLiveURL(roomid, uid, {
            self.setupDisplayView()
        })
      }
    }
    fileprivate func setupDisplayView()  {
        //0.关闭log
        IJKFFMoviePlayerController.setLogReport(false)
        
        //1.初始化播放器
        let url = URL(string: roomVM.liveURL)
        player = IJKFFMoviePlayerController(contentURL: url, with: nil)
        
        //2.设置播放器View的位置和尺寸
        if anchor?.push == 1 {
            let screenW = UIScreen.main.bounds.width
            player?.view.frame = CGRect(x: 0, y: 150, width: screenW, height: screenW * 3 / 4)
            
        }else{
            player?.view.frame = view.bounds
        }
        
        //3.将view添加到控制器view中
        bgImageView.insertSubview(player!.view, at: 1)
        
        //4.准备播放
        DispatchQueue.global().async {
            self.player?.prepareToPlay()
            self.player?.play()
        }
        
    }
    
}
extension RoomViewController{
   fileprivate func setupUI()  {
       setupBlurView()
    
       setupInfo()
    }
    
    func setupInfo()  {
        bgImageView.kf.setImage(with: URL(string: (anchor?.pic74)!))
        iconImageView.kf.setImage(with:URL(string: (anchor?.pic51)!))
        nickNameLabel.text = anchor?.name
        roomNumberLabel.text = "\(anchor?.roomid ?? 0)"
        onlineNumLabel.text = "\(anchor?.focus ?? 0)"
    }
   fileprivate func setupBlurView()  {
    let blur = UIBlurEffect(style: .dark)
    let blurView = UIVisualEffectView(effect: blur)
    blurView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    
    blurView.frame = bgImageView.bounds
    bgImageView.addSubview(blurView)
    }
}


extension RoomViewController{
    
    @IBAction func focusBtnClick(_ sender: Any) {
      navigationController?.popViewController(animated: true)
    }
    
}

// MARK:- 事件监听函数
extension RoomViewController{
    
    @IBAction func starItemClick(starItem : UIButton){
        starItem.isSelected = !starItem.isSelected
        
        starItem.isSelected ? AnimManager.shareInstance.addGranuleAnim(view: view):AnimManager.shareInstance.removeGranuleAnim()
    }
    
    @IBAction func moreItemClick(){
        
    }
    
    @IBAction func giftItemClick(){
        
    }
    
    @IBAction func shareItemClick(){
        
    }
    @IBAction func chatItemClick(){
        
    }
}













