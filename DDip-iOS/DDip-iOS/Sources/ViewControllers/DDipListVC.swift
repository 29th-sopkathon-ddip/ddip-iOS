//
//  DDipListVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

import SnapKit
import Then

final class DDipListVC: BaseViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    // MARK: - UI
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    // MARK: - Properties
    
    private lazy var cellSize = CGSize(width: UIScreen.main.bounds.size.width - 66 - 27 , height: 416)
    private var minItemSpacing: CGFloat = 4
    private let cellCount = 11
    private var previousIndex = 0
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Override Methods
    
    override func configUI() {
        super.configUI()
        
        let cellWidth: CGFloat = floor(cellSize.width)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX + 120)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        CardCVC.register(target: collectionView)
        
        titleLabel.text = "그린님,\n우리 함께\n띱한사이가\n되어볼까요"
        titleLabel.addLineSpacing(kernValue: 0, paragraphValue: 10)
        titleLabel.font = .gmarketBoldFont(ofSize: 22)
        titleLabel.textColor = .white
    }
    
    override func render() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(characterImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(416)
        }
    }
}

extension DDipListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCVC.className, for: indexPath) as? CardCVC else { return UICollectionViewCell() }
        return cell
    }
}

extension DDipListVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidthIncludeSpacing = cellSize.width + minItemSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
