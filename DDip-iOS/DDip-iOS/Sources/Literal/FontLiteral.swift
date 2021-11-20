//
//  FontLiteral.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

struct AppFontName {
    static let light = "GmarketSansLight"
    static let medium = "GmarketSansMedium"
    static let bold = "GmarketSansBold"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func gmarketLightFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.light, size: size)!
    }

    @objc class func gmarketMediumFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.medium, size: size)!
    }
    
    @objc class func gmarketBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
}


