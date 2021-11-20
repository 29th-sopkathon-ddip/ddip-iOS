//
//  CardCVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

final class CardCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool {
        get { return false }
    }
    
    // MARK: - Initailzer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
