//
//  UILabel+.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

extension UILabel {
    func addLineSpacing(kernValue: Double = -0.6, paragraphValue: CGFloat = 4.0) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = paragraphValue
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            attributedText = attributedString
            
            if #available(iOS 14.0, *) {
                lineBreakStrategy = .hangulWordPriority
            } else {
                lineBreakMode = .byWordWrapping
            }
        }
    }
}
