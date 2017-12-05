//
//  ChatToolsView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

protocol ChatToolsViewDelegate: class {
    func chatToolsView(toolView:ChatToolsView,messgae:String)
}

class ChatToolsView: UIView,NIbLoadable {

    weak var delegate:ChatToolsViewDelegate?
    
    fileprivate lazy var emoticonBtn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    
    fileprivate lazy var emoticonView:EmoticonView = EmoticonView(frame:  CGRect(x: 0, y: 0, width: KScreenW, height: 206)) { [weak self] (emoticon) in
        self?.insertEmotion(emoticon)
    }
    
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var sendMsgBtn: UIButton!
    @IBAction func textFieldDidEdit(_ sender: Any) {
    }
    @IBAction func sendBtnClick(_ sender: UIButton) {
        
        //1.获取内容
        let message = inputTextField.text!
        
        //2.清空内容
        inputTextField.text = ""
        sender.isEnabled = false
        
        //3.将内容回调回去
        delegate?.chatToolsView(toolView: self, messgae: message)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
}

extension ChatToolsView{
    
   class func loadChatToolsView() -> ChatToolsView {
        return  ChatToolsView.loadfromNib("ChatToolsView")
    }
    
    fileprivate func initUI()  {
        emoticonBtn.setImage(#imageLiteral(resourceName: "chat_btn_emoji"), for: .normal)
        emoticonBtn.setImage(#imageLiteral(resourceName: "chat_btn_keyboard"), for: .selected)
        emoticonBtn.addTarget(self, action: #selector(emoticonBtnClick(_:)), for: .touchUpInside)
        inputTextField.rightView = emoticonBtn
        inputTextField.rightViewMode = .always
        inputTextField.allowsEditingTextAttributes = true
        
        
    }
    
    @objc fileprivate func emoticonBtnClick(_ btn:UIButton)  {
        btn.isSelected = !btn.isSelected
        
        let textRange  = inputTextField.selectedTextRange
        inputTextField.resignFirstResponder()
        inputTextField.inputView = inputTextField.inputView == nil ? emoticonView : nil
        inputTextField.becomeFirstResponder()
        inputTextField.selectedTextRange = textRange
        
    }
    
    fileprivate func insertEmotion(_ emoticon:Emoticon){
        //1.点击删除按钮
        if emoticon.emoticonName == "delete-n" {
            inputTextField.deleteBackward()
            return
        }
        
        //2.插入文字
        inputTextField.replace(inputTextField.selectedTextRange!, withText: emoticon.emoticonName)
        
    }
    
    
    
    
    
}

















































