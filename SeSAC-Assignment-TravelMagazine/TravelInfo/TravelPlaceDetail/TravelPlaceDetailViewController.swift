//
//  TravelPlaceDetailViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

import Kingfisher

class TravelPlaceDetailViewController: UIViewController {
    
    var travelPlace: Travel? = nil
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet var placeDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Outlet 변수들은 viewDidLoad 호출 후 설정.
        /// ...
        /// UIKit reestablishes these connections before calling your view controller’s `viewDidLoad()` method,
        /// so you can access the objects in those properties from that method.
        /// ...
        /// https://developer.apple.com/documentation/uikit/displaying-and-managing-views-with-a-view-controller#Store-references-to-important-views
        
        travelImageView.layer.cornerRadius = 15
        if let travelPlace {
            bindData(travelPlace: travelPlace)
        }
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func bindData(travelPlace: Travel) {
        travelImageView.kf.setImage(with: travelPlace.imageURL)
        placeNameLabel.text = travelPlace.title
        placeDescriptionLabel.text = travelPlace.description
    }
    
}
