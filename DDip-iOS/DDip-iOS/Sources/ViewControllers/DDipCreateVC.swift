//
//  DDipCreateVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

class DDipCreateVC: BaseViewController {
    
    @IBOutlet weak var ddipImageView: UIImageView!
    @IBOutlet weak var ddipItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
//    override func viewDidLayoutSubviews() {
//        setupTextField()
//    }
    
    override func configUI() {
        ddipImageView.layer.cornerRadius = 10
        
    }
    
    
    
    private func setupTextField() {
        ddipItemTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: ddipItemTextField.frame.size.height+10, width: ddipItemTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        ddipItemTextField.layer.addSublayer(border)
    }
}
