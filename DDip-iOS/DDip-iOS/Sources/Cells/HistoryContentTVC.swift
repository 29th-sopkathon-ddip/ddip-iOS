//
//  HistoryContentTVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

final class HistoryContentTVC: UITableViewCell, UITableViewRegisterable {
    static var isFromNib: Bool {
        get { return false }
    }
    
    // MARK: - UI
    
    public let backView = UIView().then {
        $0.layer.cornerRadius = 22
    }
    public let photoView = UIImageView().then {
        $0.layer.cornerRadius = 22
    }
    public let titleLabel = UILabel().then {
        $0.font = .gmarketBoldFont(ofSize: 32)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubviews([photoView])
        photoView.addSubviews([backView, titleLabel])
        
        photoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(33)
        }
    }
    
    private func configUI() {
        backgroundColor = .black
    }

}
