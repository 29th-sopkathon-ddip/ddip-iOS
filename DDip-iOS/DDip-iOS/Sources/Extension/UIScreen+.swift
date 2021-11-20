//
//  UIScreen+.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

extension UIScreen{
    public var hasNotch: Bool{
        let deviceRatio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5{
            return false
        } else {
            return true
        }
    }
}
