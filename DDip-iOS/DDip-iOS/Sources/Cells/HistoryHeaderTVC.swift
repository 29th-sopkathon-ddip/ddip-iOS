//
//  HistoryHeaderTVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

import SnapKit
import Then

final class HistoryHeaderTVC: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool {
        get { return false }
    }
    
    // MARK: - UI
    
    private let countLabel = UILabel().then {
        $0.text = "4번의"
        $0.font = .gmarketBoldFont(ofSize: 42)
        $0.textColor = .white
    }
    private let infoLabel = UILabel().then {
        $0.text = "당신은 프로 나눔러!"
        $0.font = .gmarketBoldFont(ofSize: 32)
        $0.textColor = .white
    }
    private let ddipImage = UIImageView().then {
        $0.backgroundColor = .yellow
    }
    private let handImage = UIImageView().then {
        $0.backgroundColor = .gray
    }

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    
    private func render() {
        addSubviews([countLabel, ddipImage, infoLabel, handImage])
        
        countLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview().offset(-20)
        }
        
        ddipImage.snp.makeConstraints {
            $0.bottom.equalTo(countLabel.snp.bottom)
            $0.leading.equalTo(countLabel.snp.trailing).offset(20)
            $0.width.equalTo(35)
            $0.height.equalTo(42)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        handImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(infoLabel.snp.bottom)
            $0.width.equalTo(253)
            $0.height.equalTo(205)
        }
    }
    
    private func configUI() {
        backgroundColor = .black
    }
}
