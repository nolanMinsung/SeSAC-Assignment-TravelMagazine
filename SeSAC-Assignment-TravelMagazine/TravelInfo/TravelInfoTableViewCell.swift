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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        placeImageView.image = nil
    }
    
    func configure(with item: Travel) {
        placeNameLabel.text = item.title
        placeDescriptionLabel.text = item.description
        saveInfoLabel.text = "(1,812) • 저장 \(item.save ?? 0)"
        
        placeImageView.kf.setImage(
            with: item.imageURL,
            options: [.processor(DownsamplingImageProcessor(size: placeImageView.frame.size)),
                      .scaleFactor(UIScreen.main.scale)]
        )
    }
    
}
