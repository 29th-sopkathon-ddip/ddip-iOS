//
//  DDipDescriptionTVCell.swift
//  DDip-iOS
//
//  Created by 김인환 on 2021/11/21.
//

import UIKit

class DDipDescriptionTVCell: UITableViewCell {
    
    static let identifier: String = "DDipDescriptionTVCell"
    
    @IBOutlet weak var hashTag1Label: UILabel!
    @IBOutlet weak var hashTag2Label: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    
    func configUI() {
        backgroundColor = .black
        
        [hashTag1Label, hashTag2Label].forEach({$0?.font = UIFont.gmarketMediumFont(ofSize: 16)
            $0?.layer.cornerRadius = 10
            $0?.layer.masksToBounds = true
            $0?.backgroundColor = UIColor.sub2
            $0?.textColor = UIColor.white
            
        })
        hashTag1Label.text = "#N90센터문앞"
        hashTag2Label.text = "오전4시"
        
        
        descriptionLabel.layer.cornerRadius = 10
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.backgroundColor = UIColor.gray
        descriptionLabel.font = UIFont.gmarketMediumFont(ofSize: 16)
        
        descriptionLabel.text = "커피 세 개 남았어요!! 졸리신 분 띱!"
        descriptionLabel.textColor = UIColor.white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
