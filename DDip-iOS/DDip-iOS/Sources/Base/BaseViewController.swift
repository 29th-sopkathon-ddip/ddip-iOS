//
//  BaseViewController.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        render()
        configUI()
        setupLocalization()
        setData()
    }
    
    // MARK: - Override Method
    
    func render() {
        // Override Layout
    }
    
    func configUI() {
        // Configuration UI
    }
    
    func setupLocalization() {
        // Override Localization
    }
    
    func setData() {
        // Override Set Data
    }
}

