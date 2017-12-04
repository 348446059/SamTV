//
//  ChatToolsView.swift
//  SamTV
//
//  Created by libo on 2017/12/4.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class ChatToolsView: UIView,NIbLoadable {

    fileprivate lazy var emoticonBtn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    
    fileprivate lazy var emoticonView:EmoticonView = EmoticonView(frame:  CGRect(x: 0, y: 0, width: KScreenW, height: 206)) { (emoticon) in
        
    }
    
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var sendMsgBtn: UIButton!
    @IBAction func textFieldDidEdit(_ sender: Any) {
    }
    @IBAction func sendBtnClick(_ sender: Any) {
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
}

















































