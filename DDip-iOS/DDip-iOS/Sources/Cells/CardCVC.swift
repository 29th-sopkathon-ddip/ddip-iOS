//
//  CardCVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class CardCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    static var isFromNib: Bool {
        get { return false }
    }
    
    // MARK: - UI
    
    private let imageView = UIImageView().then {
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 22
        $0.layer.masksToBounds = true
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
    private let personIcon = UIImageView().then {
        $0.backgroundColor = .yellow
    }
    var ddipCountLabel = UILabel().then {
        $0.font = .gmarketBoldFont(ofSize: 18)
        $0.textColor = .white
    }
    
    weak var delegate: CardDelegate?
    
    var index: Int = 0
    
    // MARK: - Initailzer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        ddipCountLabel.text = ""
        imageView.image = nil
    }
    
    // MARK: - Setup Method
    
    private func render() {
        addSubviews([imageView, imageButton, ddipButton,
                    titleLabel, personIcon, ddipCountLabel])
        
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
        
        personIcon.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(26)
            $0.leading.equalToSuperview().inset(23)
            $0.width.height.equalTo(20)
        }
        
        ddipCountLabel.snp.makeConstraints {
            $0.top.equalTo(personIcon.snp.top)
            $0.leading.equalTo(personIcon.snp.trailing).offset(7)
        }
    }
    
    private func configUI() {
        backgroundColor = .clear
    }
    
    public func setupData(image: String, title: String, current: Int, max: Int) {
        titleLabel.text = "\(title)\n띱!"
        titleLabel.addLineSpacing(kernValue: 0, paragraphValue: 22)
        ddipCountLabel.text = "\(current)/\(max)"
        guard let url = URL(string: image) else { return }
        imageView.kf.setImage(with: url)
    }
    
    // MARK: - Selector
    
    @objc
    private func didTappedDetail() {
        
    }
    
    @objc
    private func didTappedDDip() {
        delegate?.didTappedCard(index: index)
    }
    
}
