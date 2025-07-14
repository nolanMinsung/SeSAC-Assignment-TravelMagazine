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
        initialSettings()
    }
    
    private func designTextField() {
        maxNumberInputTextField.layer.borderColor = UIColor.black.cgColor
        maxNumberInputTextField.layer.borderWidth = 1
    }
    
    private func initialSettings() {
        resultTextView.isEditable = false
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        let gameManager = Game369Manager()
        do {
            let validInputNumber = try gameManager.validateInputText(sender.text!)
            let (resultString, totalClapCount) = gameManager.show369Numbers(maxNumber: validInputNumber)
            resultTextView.text = resultString
            resultLabel.text = "숫자 \(validInputNumber)까지 총 박수는 \(totalClapCount)번입니다."
        } catch let error as Game369Error {
            let messageToShow: String
            switch error {
            case .inputNotANumber, .inputNotInteger:
                messageToShow = "정수만 입력해주세요."
            case .inputOutOfRange:
                messageToShow = "1 이상 10000 이하의 값만 입력해주세요."
            }
            resultLabel.text = messageToShow
        } catch {
            resultLabel.text = "에러가 발생했어요. 다시 시도해 주세요."
        }
    }
    
}
