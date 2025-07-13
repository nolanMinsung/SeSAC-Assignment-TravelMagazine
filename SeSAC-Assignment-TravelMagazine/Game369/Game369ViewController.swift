//
//  Game369ViewController.swift
//  SeSAC-Assignment-TravelMagazine
//
//  Created by 김민성 on 7/13/25.
//

import UIKit

class Game369ViewController: UIViewController {
    
    @IBOutlet var maxNumberInputTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField()
    }
    
    private func designTextField() {
        maxNumberInputTextField.layer.borderColor = UIColor.black.cgColor
        maxNumberInputTextField.layer.borderWidth = 1
    }
    
}
