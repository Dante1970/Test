//
//  NextViewController.swift
//  Test
//
//  Created by Сергей Белоусов on 29.06.2022.
//

import UIKit

protocol shareDate {
    func setTextField(text: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: shareDate?
    
    var textForLabel: String = "Ошибка!"
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = textForLabel
    }
    
    // MARK: - Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        if textField.text == "" {
            alert(title: "Ошибка!", message: "Заполни поле!")
        } else {
            delegate?.setTextField(text: textField.text!)
            dismiss(animated: true)
        }
    }
    
    // MARK: - Private
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
