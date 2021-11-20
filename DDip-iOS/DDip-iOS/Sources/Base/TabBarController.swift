//
//  TabBarController.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

import SnapKit
import Then

private extension CGFloat {
    static let tabbarHeight = 99.0
}

class TabBarController: BaseViewController {
    
    // MARK: - UI
    
    private let tabbar = UIView().then {
        $0.backgroundColor = .black2
        $0.clipsToBounds = false
        $0.layer.cornerRadius = 15.0
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    private let listButton = UIButton().then {
        $0.tag = 0
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(didTappedTab(sender:)), for: .touchUpInside)
    }
    private let historyButton = UIButton().then {
        $0.tag = 1
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(didTappedTab(sender:)), for: .touchUpInside)
    }
    private let createButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(didTappedCreate), for: .touchUpInside)
    }
    
    // MARK: - Properties
    
    private var selectedIndex: Int = 0
    private var previousIndex: Int = 0
    private var viewControllers = [UIViewController]()
    
    static let listVC = UIStoryboard(name: "DDipMain", bundle: nil).instantiateViewController(withIdentifier: DDipListVC.className)
    static let historyVC = UIStoryboard(name: "DDipMain", bundle: nil).instantiateViewController(withIdentifier: DDipListVC.className)
    static let createVC = UIStoryboard(name: "DDipMain", bundle: nil).instantiateViewController(withIdentifier: DDipCreateVC.className)

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    // MARK: - Override Methods
    
    override func render() {
        view.addSubview(tabbar)
        tabbar.addSubviews([listButton, historyButton, createButton])
        
        tabbar.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.hasNotch ? .tabbarHeight + 22 : .tabbarHeight)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(41)
            $0.width.height.equalTo(50)
        }
        
        historyButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(41)
            $0.width.height.equalTo(50)
        }
        
        createButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-15)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(66)
        }
    }
    
    // MARK: - Setup Methods
    
    private func setupTabbar() {
        viewControllers.append(TabBarController.listVC)
        viewControllers.append(TabBarController.historyVC)
        
        listButton.isSelected = true
        didTappedTab(sender: listButton)
    }
    
    // MARK: - Selector
    
    @objc
    private func didTappedTab(sender: UIButton) {
        previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        if previousIndex == 0 {
            historyButton.isSelected = false
        } else {
            listButton.isSelected = false
        }
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        self.view.bringSubviewToFront(tabbar)
    }
    
    @objc
    private func didTappedCreate() {
        TabBarController.createVC.modalPresentationStyle = .fullScreen
        present(TabBarController.createVC, animated: true, completion: nil)
    }
}
