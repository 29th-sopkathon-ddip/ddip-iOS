//
//  ImageLiteral.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

public enum ImageLiteral {

    public static var addButton: UIImage { .load(name: "addButton")}
    public static var backButton: UIImage { .load(name: "backButton") }
    public static var backButtonBlack: UIImage { .load(name: "backButtonBlack") }
    public static var checked: UIImage { .load(name: "checked") }
    public static var deleteButton: UIImage { .load(name: "deleteButton") }
    public static var exitButton: UIImage { .load(name: "exitButton") }
    public static var gachlion: UIImage { .load(name: "gachlion") }
    public static var unchecked: UIImage { .load(name: "unchecked") }

}

extension UIImage {
    fileprivate static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            assert(false, "\(name) 이미지 로드 실패")
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    internal func resize(to length: CGFloat) -> UIImage {
        let newSize = CGSize(width: length, height: length)
        let image = UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
            
        return image
    }
}
