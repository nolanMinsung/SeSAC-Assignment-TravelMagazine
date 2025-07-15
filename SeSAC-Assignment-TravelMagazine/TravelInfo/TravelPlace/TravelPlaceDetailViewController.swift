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
