//
//  City.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/15/25.
//


//City(
//    city_name: "방콕",
//    city_english_name: "Bangkok",
//    city_explain: "방콕, 파타야, 후아힌, 코사멧, 코사무이",
//    city_image: "https://",
//    domestic_travel: false
//)

import Foundation

struct City: Hashable {
    let koreanName: String
    let englishName: String
    let explain: String // 배열로 만들어도 좋을 듯..!
    let imageURL: URL?
    let isDomestic: Bool
    
    init(
        city_name: String,
        city_english_name: String,
        city_explain: String,
        city_image: String,
        domestic_travel: Bool
    ) {
        self.koreanName = city_name
        self.englishName = city_english_name
        self.explain = city_explain
        self.imageURL = URL(string: city_image)
        self.isDomestic = domestic_travel
    }
}
