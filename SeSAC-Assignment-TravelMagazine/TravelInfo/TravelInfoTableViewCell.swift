//
//  TravelInfoTableViewCell.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/14/25.
//

import UIKit

import Kingfisher

class TravelInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeDescriptionLabel: UILabel!
    @IBOutlet var saveInfoLabel: UILabel!
    
    @IBOutlet var placeImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        placeImageView.layer.cornerRadius = 10
        configureLikeButton()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        placeImageView.image = nil
        likeButton.isSelected = false
    }
    
    private func configureLikeButton() {
        likeButton.configuration = UIButton.Configuration.plain()
        likeButton.configuration?.baseBackgroundColor = .clear
        likeButton.configurationUpdateHandler = { button in
            button.configuration?.image = (button.isSelected
                                          ? .init(systemName: "heart.fill")
                                          : .init(systemName: "heart"))
        }
    }
    
    func configure(with item: Travel) {
        guard !item.ad else { fatalError() }
        placeNameLabel.text = item.title
        placeDescriptionLabel.text = item.description
        saveInfoLabel.text = "(1,812) • 저장 \(item.save ?? 0)"
        likeButton.isSelected = item.like!
        
        // Downsampling 관련 코드는 Kingfisher 사용법 정도만 익힌 수준.
        // 추후 공부 필요함.
        placeImageView.kf.setImage(
            with: item.imageURL,
            options: [
                .processor(DownsamplingImageProcessor(size: placeImageView.frame.size)),
                .scaleFactor(UIScreen.main.scale),
                .cacheMemoryOnly
            ]
        )
    }
    
}
