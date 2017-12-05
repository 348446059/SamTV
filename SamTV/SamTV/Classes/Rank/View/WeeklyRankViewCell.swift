


import UIKit

class WeeklyRankViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var giftNameLabel: UILabel!
    @IBOutlet weak var giftNumLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var weekly : WeeklyModel? {
        didSet {
           
            iconImageView.kf.setImage(with:  URL(string: (weekly?.giftAppImg)!))
            giftNameLabel.text = weekly?.giftName
            giftNumLabel.text = "本周获得 x\(weekly?.giftNum ?? 0)个"
            nickNameLabel.text = weekly?.nickname
        }
    }
}
