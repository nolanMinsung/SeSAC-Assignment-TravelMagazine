//
//  TravelInfoTableAdCell.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

class TravelInfoTableAdCell: UITableViewCell {
    
    
    @IBOutlet var contentBackgroundView: UIView!
    @IBOutlet var adBadge: UILabel!
    @IBOutlet var adTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentBackgroundView.layer.cornerRadius = 10
        adBadge.layer.cornerRadius = 7
        adBadge.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        adTextLabel.text = nil
    }
    
    func configure(with item: Travel) {
        guard item.ad == true else { fatalError() }
        adTextLabel.text = item.title
    }
    
}
