//
//  DDipPersonTVCell.swift
//  DDip-iOS
//
//  Created by 김인환 on 2021/11/21.
//

import UIKit

class DDipPersonTVCell: UITableViewCell {
    
    static let identifier: String = "DDipPersonTVCell"

    @IBOutlet weak var personIcon: UIImageView!
    @IBOutlet weak var personPercentageLabel: UILabel!
    @IBOutlet weak var personBackView: UIView!
    
    @IBOutlet var eachPersonBackView: [UIView]!
    
    @IBOutlet weak var personStackView: UIStackView!
    
    @IBOutlet var personNameLabelList: [UILabel]!
    
    @IBOutlet var imageviewList: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    
    func configUI() {
        backgroundColor = UIColor.black
        
        personPercentageLabel.text = "2/3"
        personPercentageLabel.font = UIFont.gmarketBoldFont(ofSize: 18)
        personPercentageLabel.textColor = UIColor.white
        
        personBackView.backgroundColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        personBackView.layer.masksToBounds = true
        personBackView.layer.cornerRadius = 10
        
        personStackView.backgroundColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        
        personNameLabelList.forEach({$0.font = UIFont.gmarketMediumFont(ofSize: 16)
            $0.textColor = UIColor(red: 0.488, green: 0.488, blue: 0.488, alpha: 1)
        })
        
        imageviewList.forEach({
            $0.image = UIImage(systemName: "pencil")
        })
        
        eachPersonBackView.forEach({
            $0.backgroundColor = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
        })
        
    }
}
