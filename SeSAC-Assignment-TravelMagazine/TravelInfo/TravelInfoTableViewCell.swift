//
//  TravelInfoTableViewCell.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/14/25.
//

import UIKit

class TravelInfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeDescriptionLabel: UILabel!
    @IBOutlet var reviewInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
