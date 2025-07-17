//
//  CitySearchingCollectionViewCell.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/17/25.
//

import UIKit

import Kingfisher

class CitySearchingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeInfoLabel: UILabel!
    @IBOutlet var dimmingView: UIView!
    var city: City? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        placeNameLabel.attributedText = nil
        placeInfoLabel.attributedText = nil
    }
    
    // 눌리면 살짝 들어가도록
    override var isHighlighted: Bool {
        didSet {
            let scale: CGFloat = isHighlighted ? 0.98 : 1
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: 1
            ) {[weak self] in
                guard let self else { return }
                self.transform = .init(scaleX: scale, y: scale)
                self.dimmingView.backgroundColor = self.isHighlighted ? .systemGray5 : .clear
            }
        }
    }
    
    // 둥글게 둥글게
    func designCornersRounding(cornerRadius: CGFloat) {
        // 셀의 코너는 적당히 부드럽게
        contentView.layer.cornerRadius = 35
        contentView.clipsToBounds = true
        
        placeImageView.layer.cornerRadius = cornerRadius
        placeImageView.clipsToBounds = true
    }
    
    func configure(with item: City) {
        city = item
        placeImageView.kf.setImage(with: item.imageURL)
        placeNameLabel.text = "\(item.koreanName) | \(item.englishName)"
        placeInfoLabel.text = item.explain
    }
    
    func highlighSearchedText(_ searchText: String, color: UIColor) {
        placeNameLabel.highlightAll(of: searchText, color: color, caseSensitive: false)
        placeInfoLabel.highlightAll(of: searchText, color: color, caseSensitive: false)
    }
    
    
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize() // 필수인가?
        print(#function)
    }
    
}
