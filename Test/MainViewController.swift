//
//  ViewController.swift
//  Test
//
//  Created by Сергей Белоусов on 28.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDoneButton(to: textField)
    }
    
    // MARK: - Override
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if let dest = segue.destination as? NextViewController {
                // Перед переходом получаю делегат
                dest.delegate = self
                dest.textForLabel = textField.text!
            }
        }
    
    // Скрить клавиатуру при нажатии вне текстового поля
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Action
    @IBAction func buttonPressed(_ sender: UIButton) {
        if textField.text == "" {
            alert(title: "Ошибка!", message: "Пустое поле!")
        } else {
            // Скрыть клавиатуру при нажатии кнопки
            view.endEditing(true)
            
            performSegue(withIdentifier: "NextViewController", sender: nil)
        }
    }
    
    // MARK: - Private
    private func alert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ок", style: .default)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // добавляем кнопку Done
    private func addDoneButton(to textFields: UITextField...) {
        textFields.forEach { textField in
            let keyboardToolBar = UIToolbar()
            textField.inputAccessoryView = keyboardToolBar
            keyboardToolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
            
            let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            keyboardToolBar.items = [flexBarButton, doneButton]
        }
    }
    
    // закрытие клавиатуры после нажатия кнопки
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

// MARK: - Delegate
extension MainViewController: shareDate {
    func setTextField(text: String) {
        textField.text = text
    }
}
