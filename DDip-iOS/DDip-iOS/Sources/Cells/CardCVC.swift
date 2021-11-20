//
//  CardCVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

final class CardCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool {
        get { return false }
    }
    
    // MARK: - UI
    
    private let imageView = UIImageView().then {
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 22
    }
    private let imageButton = UIButton().then {
        $0.backgroundColor = .main.withAlphaComponent(0.9)
        $0.layer.cornerRadius = 22
        $0.addTarget(self, action: #selector(didTappedDetail), for: .touchUpInside)
    }
    private let ddipButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.addTarget(self, action: #selector(didTappedDDip), for: .touchUpInside)
    }
    private let titleLabel = UILabel().then {
        $0.font = .gmarketBoldFont(ofSize: 42)
        $0.textColor = .white
        $0.numberOfLines = 0
    }
    
    // MARK: - Initailzer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    
    private func render() {
        addSubviews([imageView, imageButton, ddipButton,
                    titleLabel])
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width - 66 - 27 - 21)
            $0.top.bottom.leading.equalToSuperview()
        }
        
        imageButton.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width - 66 - 27 - 21)
            $0.top.bottom.leading.equalToSuperview()
        }
        
        ddipButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(152)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(61)
            $0.leading.equalToSuperview().inset(32)
            $0.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func configUI() {
        backgroundColor = .clear
        
        titleLabel.text = "커피 세 병! 띱!"
        titleLabel.addLineSpacing(kernValue: 0, paragraphValue: 22)
    }
    
    // MARK: - Selector
    
    @objc
    private func didTappedDetail() {
        print("detail")
    }
    
    @objc
    private func didTappedDDip() {
        print("ddip")
    }
    
}
