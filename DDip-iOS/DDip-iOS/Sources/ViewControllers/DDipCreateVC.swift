//
//  DDipCreateVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

import PhotosUI

class DDipCreateVC: BaseViewController {
    
    @IBOutlet weak var ddipCreateView: UIView!
    
    @IBOutlet weak var ddipImageView: UIImageView!
    
    @IBOutlet weak var ddipTitleTextField: UITextField!
    @IBOutlet weak var ddipPalceTextField: UITextField!
    @IBOutlet weak var ddipTimeTextField: UITextField!
    
    @IBOutlet weak var ddipMinusCountButton: UIButton!
    @IBOutlet weak var ddipPlusCountButton: UIButton!
    @IBOutlet weak var ddipCountLabel: UILabel!
    
    @IBOutlet weak var ddipDetailTextView: UITextView!
    
    @IBOutlet weak var ddipPostButton: UIButton!
    
    var focusTextFieldBottom: CGFloat = 0.0
    var focusTextViewBottom: CGFloat = 0.0
    
    var ddipCount: Int = 0
    
    let detailTextViewPlaceholder = "띱 한마디 작성하기"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupDelegate()
        setupTextField()
        setupTextViewPlaceholder()
    }
    
    override func configUI() {
        super.configUI()
        [ddipImageView, ddipDetailTextView].forEach {
            $0.layer.cornerRadius = 10
        }
        ddipPostButton.isEnabled = false
    }
    
    private func setupDelegate() {
        [ddipTitleTextField, ddipPalceTextField, ddipTimeTextField].forEach {
            $0?.delegate = self
        }
    }
    
    private func setupTextField() {
        ddipTitleTextField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: ddipTitleTextField.frame.size.height+10, width: ddipTitleTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        ddipTitleTextField.layer.addSublayer(border)
    }
    
    private func setupTextViewPlaceholder() {
        ddipDetailTextView.delegate = self
        ddipDetailTextView.text = detailTextViewPlaceholder
        ddipDetailTextView.textColor = UIColor.placeholder
        ddipDetailTextView.textContainerInset = UIEdgeInsets(top: 12, left: 17, bottom: 15, right: 17)
    }
    
    @IBAction func touchUpMinusButton(_ sender: Any) {
        ddipCount -= 1
        ddipCountLabel.text = "\(ddipCount)명"
    }
    
    @IBAction func touchUpPlusButton(_ sender: Any) {
        ddipCount += 1
        ddipCountLabel.text = "\(ddipCount)명"
    }
}

extension DDipCreateVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if ddipDetailTextView.textColor == UIColor.placeholder {
            ddipDetailTextView.text = nil
            ddipDetailTextView.textColor = UIColor.white
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.ddipCreateView.transform = CGAffineTransform(translationX: 0, y: -250)
        }, completion: nil)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if ddipDetailTextView.text.isEmpty {
            ddipDetailTextView.text = "띱 한마디 작성하기"
            ddipDetailTextView.textColor = UIColor.placeholder
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.ddipCreateView.transform = .identity
        }, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        guard let isPlaceEmpty = ddipPalceTextField.text?.isEmpty,
              let isTimeEmpty = ddipTimeTextField.text?.isEmpty
        else { return }
        
        if isPlaceEmpty || isTimeEmpty, ddipDetailTextView.text != detailTextViewPlaceholder {
            ddipPostButton.isEnabled = false
        } else {
            ddipPostButton.isEnabled = true
        }
    }
}

extension DDipCreateVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        focusTextFieldBottom = textField.frame.origin.y + textField.frame.height
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.ddipCreateView.transform = CGAffineTransform(translationX: 0, y: -50)
        }, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.ddipCreateView.transform = .identity
        }, completion: nil)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isPlaceEmpty = ddipPalceTextField.text?.isEmpty,
              let isTimeEmpty = ddipTimeTextField.text?.isEmpty
        else { return }
        
        if isPlaceEmpty || isTimeEmpty, ddipDetailTextView.text != detailTextViewPlaceholder {
            ddipPostButton.isEnabled = true
        } else {
            ddipPostButton.isEnabled = false
        }
    }
}
