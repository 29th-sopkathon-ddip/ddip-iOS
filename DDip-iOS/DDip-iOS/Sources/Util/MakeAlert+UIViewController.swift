//
//  MakeAlert+UIViewController.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

extension UIViewController {
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
