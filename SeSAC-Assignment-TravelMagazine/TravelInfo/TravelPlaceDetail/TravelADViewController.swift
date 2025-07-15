//
//  TravelADViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/15/25.
//

import UIKit

class TravelADViewController: UIViewController {
    
    var adText: String = ""
    
    @IBOutlet var adTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Outlet 변수들은 viewDidLoad 호출 후 설정.
        /// ...
        /// UIKit reestablishes these connections before calling your view controller’s `viewDidLoad()` method,
        /// so you can access the objects in those properties from that method.
        /// ...
        /// https://developer.apple.com/documentation/uikit/displaying-and-managing-views-with-a-view-controller#Store-references-to-important-views
        adTextLabel.text = adText
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
