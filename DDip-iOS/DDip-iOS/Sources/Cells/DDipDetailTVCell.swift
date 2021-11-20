//
//  DDipDetailTVCell.swift
//  DDip-iOS
//
//  Created by 김인환 on 2021/11/21.
//

import UIKit

class DDipDetailTVCell: UITableViewCell {
    
    static let identifier: String = "DDipDetailTVCell"
    
    // MARK: - IBOutlet
    @IBOutlet weak var ddipItemImageView: UIImageView!
    @IBOutlet weak var ddipCreatorLabel: UILabel!
    @IBOutlet weak var ddipItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    func configUI() {
        backgroundColor = UIColor.black
        
        ddipItemImageView.layer.masksToBounds = true
        ddipItemImageView.layer.cornerRadius = 10
        
        ddipCreatorLabel.font = UIFont.gmarketMediumFont(ofSize: 16)
        ddipCreatorLabel.text = "수진님의"
        ddipCreatorLabel.textColor = UIColor.white
        
        ddipItemLabel.font = UIFont.gmarketBoldFont(ofSize: 32)
        ddipItemLabel.text = "커피 세 병"
        ddipItemLabel.textColor = UIColor.white
    }
}
