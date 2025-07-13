//
//  MagazineCell.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/13/25.
//

import UIKit

class MagazineCell: UITableViewCell {
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var postDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImageView.layer.cornerRadius = 15
        mainImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
