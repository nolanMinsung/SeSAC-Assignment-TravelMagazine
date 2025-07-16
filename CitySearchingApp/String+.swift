//
//  String+.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/16/25.
//

import UIKit


extension String {
    
    /// 특정 문자열에서 검색하고자 하는 문자열의 모든 범위를 배열로 반환.
    /// - Parameter text: 검색하고자 하는 문자열
    /// - Returns: 문자열 내의 모든 검색어 영역(`Range<String.Index>`) 을 배열로 반환.
    ///
    /// `iOS 16.0` 이후부터는 `ranges(of: text)` 메서드를 사용할 수 있으나, 이전 버전에는 사용 불가.
    ///
    /// 따라서 `iOS 16.0` 미만의 버전에서는 직접 구현하였음. (재귀함수를 이용.)
    ///
    /// 내부에서 사용되는 `range(of:options:range:locale:)` 메서드는 `Foundation` 프레임워크에 구현되어 있기 때문에, 이 함수를 사용하기 위해서는 `Foundation` 프레임워크 `import` 필요
    func findAllRanges(of text: String, caseSensitive: Bool = true) -> [Range<String.Index>] {
        if caseSensitive {
            return _findAllRanges(of: text)
        } else {
            return lowercased()._findAllRanges(of: text.lowercased())
        }
    }
    
    private func _findAllRanges(of text: String) -> [Range<String.Index>] {
        if #available(iOS 16.0, *) {
            return ranges(of: text)
        } else {
            guard let firstOccurredRange = self.range(of: text) else { return [] }
            
            let remainString = String(self[index(after: firstOccurredRange.upperBound)...endIndex])
            return [firstOccurredRange] + remainString.findAllRanges(of: text)
        }
    }
    
    func makeColored(with searchText: String, color: UIColor, caseSensitive: Bool = true) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(string: self)
        
        self.findAllRanges(of: searchText, caseSensitive: caseSensitive).forEach { range in
            mutableString.addAttributes(
                [.foregroundColor: color],
                range: NSRange(range, in: self)
            )
        }
        return mutableString as NSAttributedString
    }
    
    
}
