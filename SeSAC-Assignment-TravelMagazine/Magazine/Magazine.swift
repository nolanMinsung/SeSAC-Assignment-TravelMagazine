//
//  Magazine.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/13/25.
//

import UIKit

//Magazine(
//    title: "유럽 여행 쇼핑 성지, OOO은 꼭 가세요!",
//    subtitle: "유럽의 인기 쇼핑 명소 총정리",
//    photo_image: "https://cdn.pixabay.com/photo/2016/11/22/21/57/apparel-1850804_1280.jpg",
//    date: "241118",
//    link: "https://triple.guide/articles/265bd919-3f75-4adc-8d5d-c5cf60201bfe"
//)

struct Magazine {
    static let dateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        return formatter
    }()
    
    let title: String
    let subtitle: String
    let imageURL: URL?
    let date: Date
    let linkURL: URL?
    
    init?(title: String, subtitle: String, photo_image: String, date: String, link: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = URL(string: photo_image)
        if self.imageURL == nil { print("image URL format of \(title) is invalid.") }
        
        guard let date = Self.dateFormatter.date(from: date) else { return nil }
        self.date = date
        
        self.linkURL = URL(string: link)
        if self.linkURL == nil { print("link URL format of \(title) is invalid.") }
    }
}
