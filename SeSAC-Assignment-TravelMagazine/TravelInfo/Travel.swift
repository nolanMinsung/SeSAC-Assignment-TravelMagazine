//
//  Travel.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/15/25.
//

import Foundation

//Travel(
//    title: "하나우마 베이",
//    description: "아름다운 자연을 감상할 수 있는 스노쿨링 명소",
//    travel_image: "",
//    grade: 4.8,
//    save: 6932,
//    like: false,
//    ad: false
//)

struct Travel {
    var title: String
    var description: String?
    var imageURL: URL?
    var grade: Double?
    var save: Int?
    var like: Bool?
    var ad: Bool
    
    init(
        title: String,
        description: String? = nil,
        travel_image: String? = nil,
        grade: Double? = nil,
        save: Int? = nil,
        like: Bool? = nil,
        ad: Bool
    ) {
        self.title = title
        self.description = description
        if let travelImageURL = travel_image {
            self.imageURL = URL(string: travelImageURL)
        } else {
            self.imageURL = nil
        }
        self.grade = grade
        self.save = save
        self.like = like
        self.ad = ad
    }
}
