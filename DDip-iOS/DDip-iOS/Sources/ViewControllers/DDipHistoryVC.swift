//
//  DDipHistoryVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/21.
//

import UIKit

import SnapKit
import Then

final class DDipHistoryVC: BaseViewController {
    
    // MARK: - Section
    
    enum Section: Int, CaseIterable {
        case header
        case content
    }
    
    // MARK: - UI
    
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .black
        $0.delegate = self
        $0.dataSource = self
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: UIScreen.main.hasNotch ? .tabbarHeight + 22 : .tabbarHeight , right: 0)
        
        HistoryHeaderTVC.register(target: $0)
        HistoryContentTVC.register(target: $0)
    }
    
    // MARK: - Properties
    
    private let colors: [UIColor] = [.main, .sub3, .sub2, .sub1]
    private let items: [String] = ["허니갈릭!", "아이셔 한박스!", "상추 세봉지!", "피자 한조각!"]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Override Method
    
    override func render() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func configUI() {
        super.configUI()
    }
}

extension DDipHistoryVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section.init(rawValue: section) else { return 0 }
        
        switch section {
        case .header:
            return 1
        case .content:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section.init(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryHeaderTVC.className, for: indexPath) as? HistoryHeaderTVC else { return UITableViewCell() }
            return cell
        case .content:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryContentTVC.className, for: indexPath) as? HistoryContentTVC else { return UITableViewCell() }
            cell.backView.backgroundColor = colors[indexPath.row].withAlphaComponent(0.9)
            cell.titleLabel.text = items[indexPath.row]
            cell.titleLabel.textColor = indexPath.row % 2 == 0 ? .white : .black
            
            return cell
        }
    }
}

extension DDipHistoryVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section.init(rawValue: indexPath.section) else { return 0.0 }
        
        switch section {
        case .header:
            return 398
        case .content:
            return 121
        }
    }
}
