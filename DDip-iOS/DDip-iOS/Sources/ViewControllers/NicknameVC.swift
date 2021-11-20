//
//  NicknameVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

import SnapKit
import Then

final class NicknameVC: BaseViewController {

    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
        super.viewDidLoad()
    }
    
    // MARK: - Override Method
    
    override func render() {
        view.backgroundColor = .main
    }
    
    override func configUI() {
        lastLabel.font = .gmarketBoldFont(ofSize: 30)
        lastLabel.textColor = .white
        
        infoLabel.font = .gmarketBoldFont(ofSize: 18)
        infoLabel.textColor = .white
        
        textField.textColor = .black
        textField.font = .gmarketBoldFont(ofSize: 16)
        
        startButton.backgroundColor = .black
        startButton.layer.cornerRadius = 10
    }

}
