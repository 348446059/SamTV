//
//  RoomViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/1.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit
import IJKMediaFramework

private let KMoreInfoViewH:CGFloat = 90
private let KGiftListViewH:CGFloat = 320
private let KSocialShareViewH:CGFloat = 250
private let KChatToolsViewH:CGFloat = 44
private let KChatContentViewH:CGFloat = 160

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
    
    //MARK:懒加载属性
    fileprivate lazy var moreInfoView = MoreInfoView.loadMoreInfoView()
    
    fileprivate lazy var socialShareView = SocialShareView.loadSocialShareView()
    
    fileprivate lazy var chatToolsView = ChatToolsView.loadChatToolsView()
    
    fileprivate lazy var giftListView = GiftListView.loadGiftListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadRoomInfo()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
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
       setupBottomView()
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
    
   fileprivate func setupBottomView()  {
    
    moreInfoView.frame = CGRect(x: 0, y: KScreenH, width: KScreenW, height: KMoreInfoViewH)
    view.addSubview(moreInfoView)
    
    socialShareView.frame = CGRect(x: 0, y: KScreenH, width: KScreenW, height: KSocialShareViewH)
    view.addSubview(socialShareView)
    
    giftListView.frame = CGRect(x: 0, y: KScreenH, width: KScreenW, height: KGiftListViewH)
    giftListView.deleagte = self
    view.addSubview(giftListView)
    
    chatToolsView.frame = CGRect(x: 0, y: KScreenH, width: KScreenW, height: KChatToolsViewH)
    chatToolsView.delegate = self
    view.addSubview(chatToolsView)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        UIView.animate(withDuration: 0.25) {
            self.giftListView.frame.origin.y = KScreenH
            self.socialShareView.frame.origin.y = KScreenH
            self.chatToolsView.frame.origin.y = KScreenH
            self.moreInfoView.frame.origin.y = KScreenH
        }
    }
    
    
    
}


extension RoomViewController{
    
    @IBAction func focusBtnClick(_ sender: Any) {
      navigationController?.popViewController(animated: true)
    }
    
}

//MARK:-聊天回调
extension RoomViewController:ChatToolsViewDelegate{
    func chatToolsView(toolView: ChatToolsView, messgae: String) {
        print(messgae)
    }
    
    
}

//MARK:-礼物回调
extension RoomViewController:GiftListViewDelegate{
    func giftListView(giftView: GiftListView, giftModel: GiftModel) {
        
    }
    
    
    
}


// MARK:- 事件监听函数
extension RoomViewController{
    
    @IBAction func starItemClick(starItem : UIButton){
        starItem.isSelected = !starItem.isSelected
        
        starItem.isSelected ? AnimManager.shareInstance.addGranuleAnim(view: view):AnimManager.shareInstance.removeGranuleAnim()
    }
    
    @IBAction func moreItemClick(){
        UIView.animate(withDuration: 0.25) {
            self.moreInfoView.frame.origin.y = KScreenH - KMoreInfoViewH
        }
    }
    
    @IBAction func giftItemClick(){
        UIView.animate(withDuration: 0.25) {
            self.giftListView.frame.origin.y = KScreenH - KGiftListViewH
        }
    }
    
    @IBAction func shareItemClick(){
        UIView.animate(withDuration: 0.25) {
            self.socialShareView.frame.origin.y = KScreenH - KSocialShareViewH
        }
        self.socialShareView.showShareView()
        
    }
    @IBAction func chatItemClick(){
         chatToolsView.inputTextField.becomeFirstResponder()
    }
    
    
    //键盘监听事件
    @objc func keyboardWillChangeFrame(_ note:NSNotification)  {
        let duration = note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let endFrame = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let inputValueY = endFrame.origin.y - KChatToolsViewH
        
        UIView.animate(withDuration: duration) {
              UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: 7)!)
            self.chatToolsView.frame.origin.y = inputValueY
            
        }
        
        
        
        
    }
}













