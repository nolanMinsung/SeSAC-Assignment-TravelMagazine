//
//  CityDetailViewController.swift
//  CitySearchingApp
//
//  Created by 김민성 on 7/16/25.
//

import UIKit

import Kingfisher

class CityDetailViewController: UIViewController {
    
    var city: City? = nil
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabelKorean: UILabel!
    @IBOutlet var cityNameLabelEnglish: UILabel!
    @IBOutlet var cityDetailInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImageView.layer.cornerRadius = 15
        cityImageView.clipsToBounds = true
        configure(with: city)
    }
    
    private func configure(with city: City?) {
        cityImageView.kf.setImage(with: city?.imageURL)
        cityNameLabelKorean.text = city?.koreanName ?? "한국어 이름입니다.🇰🇷"
        cityNameLabelEnglish.text = city?.englishName ?? "영어 이름입니다."
        cityDetailInfoLabel.text = city?.explain ?? "이곳은 추가적인 설명이 들어가는 곳입니다. 여행을 가고 싶네요."
    }
    
}
