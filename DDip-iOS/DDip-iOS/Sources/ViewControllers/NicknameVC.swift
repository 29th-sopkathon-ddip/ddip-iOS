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
    
    private let manager = LoginManager.shared
    
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
    
    @IBAction func didTappedRegister(_ sender: Any) {
        guard let nickname = textField.text else { return }
        manager.dispatchLogin(nickname: nickname, completion: {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: TabBarController.className) as? TabBarController else { return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        })
    }
    

}
