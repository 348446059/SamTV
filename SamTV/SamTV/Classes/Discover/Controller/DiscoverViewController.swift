//
//  DiscoverViewController.swift
//  SamTV
//
//  Created by libo on 2017/12/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
   fileprivate lazy var carouselView = CarouselView.loadCarouseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
}

extension DiscoverViewController{
    
   fileprivate func initUI()  {
        setupHeaderView()
        setupFooterView()
    tableView.rowHeight = KScreenW * 1.4
    }
    
   private func setupHeaderView()  {
    let carouselViewH = KScreenW * 0.4
    carouselView.frame = CGRect(x: 0, y: CGFloat(-carouselViewH), width:CGFloat(KScreenW), height: carouselViewH)
    
    tableView.tableHeaderView = carouselView
    
    }
    
   private func setupFooterView() {
    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: KScreenW, height: 80))
    
    let btn = UIButton(frame: CGRect.zero)
    btn.frame.size = CGSize(width: KScreenW * 0.5, height: 40)
    btn.center = CGPoint(x: KScreenW * 0.5, y: 40)
    btn.setTitle("换一换", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
    btn.layer.cornerRadius = 5
    btn.layer.borderColor = UIColor.orange.cgColor
    btn.layer.borderWidth = 0.5
    btn.addTarget(self, action: #selector(switchGuessAnchor), for: .touchUpInside)
    
    footerView.addSubview(btn)
    footerView.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    tableView.tableFooterView = footerView
    }
    
    @objc private func switchGuessAnchor(){
        let cell = tableView.visibleCells.first as? DiscoverTableViewCell
        cell?.reloadData()
        let offset = CGPoint(x: 0, y: KScreenW * 0.4 - 64)
        tableView.setContentOffset(offset, animated: true)
    }
    
    fileprivate func setupSectionHeaderView()->UIView{
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: KScreenW, height: 40))
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: KScreenW, height: 40))
        headerLabel.textAlignment = .center
        headerLabel.text = "猜你喜欢"
        headerLabel.textColor = UIColor.orange
        headerView.addSubview(headerLabel)
        headerView.backgroundColor = UIColor.white
        return headerView
    }
}

extension DiscoverViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverTableCellID", for: indexPath) as! DiscoverTableViewCell
        
        cell.cellDidSelected = { (anchor : AnchorModel) in
            let liveVc = RoomViewController()
            liveVc.anchor = anchor
            self.navigationController?.pushViewController(liveVc, animated: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return setupSectionHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

