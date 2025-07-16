//
//  UILabel+.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/16/25.
//

import UIKit


extension UILabel {
    
    func highlightAll(of searchText: String, color: UIColor, caseSensitive: Bool = true) {
        guard let text else { return }
        let allRanges = text.findAllRanges(of: searchText, caseSensitive: caseSensitive)
        guard !allRanges.isEmpty else { return }
        self.attributedText = text.makeColored(with: searchText, color: color, caseSensitive: caseSensitive)
    }
    
}
