//
//  CitySearchingTableViewCell.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

import Kingfisher

class CitySearchingTableViewCell: UITableViewCell {
    
    @IBOutlet var contentsContainerView: UIView!
    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 둥글게 둥글게
        contentsContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        contentsContainerView.layer.cornerRadius = 20
        contentsContainerView.clipsToBounds = true
    }
    
    /// 컨텐츠를 채워봅시다.
    func configure(with item: City) {
        placeImageView.kf.setImage(with: item.imageURL)
        placeNameLabel.text = "\(item.koreanName) | \(item.englishName)"
        placeInfoLabel.text = item.explain
        
    }
    
}
