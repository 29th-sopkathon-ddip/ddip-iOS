//
//  DDipDetailVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

class DDipDetailVC: BaseViewController {
    // MARK: - Properties
    
    var ddipIconImage: UIImage = UIImage()
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var ddipDetailViewTitleLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet weak var ddipButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Override Methods
    
    override func render() {
        super.render()
    }
    
    override func configUI() {
        super.configUI()
        
        topBar.backgroundColor = UIColor.black
        
        ddipButton.backgroundColor = UIColor.main
        
        ddipDetailViewTitleLabel.text = "띱 정보"
        ddipDetailViewTitleLabel.font = UIFont.gmarketBoldFont(ofSize: 18)
        
        ddipButton.backgroundColor = UIColor.main
        detailTableView.backgroundColor = UIColor.black
        
        detailTableView.allowsSelection = false
    }
    
    override func setupLocalization() {
        super.setupLocalization()
        detailTableView.dataSource = self
        detailTableView.delegate = self
        
        detailTableView.register(UINib(nibName: "DDipDetailTVCell", bundle: Bundle.main), forCellReuseIdentifier: DDipDetailTVCell.identifier)
        detailTableView.register(UINib(nibName: "DDipDescriptionTVCell", bundle: Bundle.main), forCellReuseIdentifier: DDipDescriptionTVCell.identifier)
        detailTableView.register(UINib(nibName: "DDipPersonTVCell", bundle: Bundle.main), forCellReuseIdentifier: DDipPersonTVCell.identifier)
    }
    
    override func setData() {
        super.setData()
    }
    
}

// MARK: - Extensions

extension DDipDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell: DDipDetailTVCell = tableView.dequeueReusableCell(withIdentifier: DDipDetailTVCell.identifier, for: indexPath) as? DDipDetailTVCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell: DDipDescriptionTVCell = tableView.dequeueReusableCell(withIdentifier: DDipDescriptionTVCell.identifier, for: indexPath) as? DDipDescriptionTVCell else { return UITableViewCell() }
            
            return cell
            
        default:
            guard let cell: DDipPersonTVCell = tableView.dequeueReusableCell(withIdentifier: DDipPersonTVCell.identifier, for: indexPath) as? DDipPersonTVCell else { return UITableViewCell() }
            
            return cell
        }
    }
}

extension DDipDetailVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
