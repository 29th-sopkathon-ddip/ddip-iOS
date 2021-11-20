//
//  DDipListVC.swift
//  DDip-iOS
//
//  Created by SHIN YOON AH on 2021/11/20.
//

import UIKit

import SnapKit
import Then

protocol CardDelegate: AnyObject {
    func didTappedCard(index: Int)
    func didTappedDetail(index: Int)
}

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
    private var previousIndex = 0
    private let colors: [UIColor] = [.main, .sub3, .sub2, .sub1]
    
    // MARK: - Manager
    
    private let manager = MainManager.shared
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetchMain { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "show"), object: nil)
        collectionView.reloadData()
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
        
        titleLabel.text = "\(UserDefaultStorage.userName)님,\n우리 함께\n띱한사이가\n되어볼까요"
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
        return manager.lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCVC.className, for: indexPath) as? CardCVC else { return UICollectionViewCell() }
        cell.delegate = self
        cell.index = indexPath.item
        let index = manager.lists[indexPath.row]
        cell.setupData(image: index.imageURL, title: index.title, current: index.currentCount, max: index.maxCount)
        cell.imageButton.backgroundColor = colors[indexPath.item%4].withAlphaComponent(0.9)
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

extension DDipListVC: CardDelegate {
    func didTappedCard(index: Int) {
        manager.dispatchMain(postId: manager.lists[index].id, completion: {
            guard let card = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? CardCVC else { return }
            card.ddipCountLabel.text = "\(self.manager.lists[index].currentCount + 1)/\(self.manager.lists[index].maxCount)"
            
            self.makeAlert(title: "띱 성공!\n우리 사이 띱한 사이", message: "")
        })
    }
    
    func didTappedDetail(index: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DDipDetailVC.className) as? DDipDetailVC else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
