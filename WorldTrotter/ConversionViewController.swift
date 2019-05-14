//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Oleksandr Gribov on 7/8/18.
//  Copyright © 2018 Oleksandr Gribov. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celciusLabel : UILabel!
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged (_ textField: UITextField){
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement (value: value, unit: .fahrenheit)
        }else {
            fahrenheitValue = nil
        }
    }
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("ConversionViewController loaded its view")
        updateCelsiusLabel()
        
    }
    var calsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue{
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBAction func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    // hides the keyboard when tapped away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // converts fahrenheit into celcius
    func updateCelsiusLabel() {
        if let celsiusValue = calsiusValue {
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celciusLabel.text = "???"
        }
    }
    var fahrenrheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        let invalidCharacters = NSCharacterSet.letters
        
        let range = string.rangeOfCharacter(from: invalidCharacters)
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil
        {
            return false
        }
        if range != nil  {
            return false
        }else {
            return true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        let calendar = Calendar.current
        let now = Date()
        let eightPM = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: now)!
        let fiveAM = calendar.date(bySettingHour: 5, minute: 45, second: 0, of: now)!

        if now >= eightPM && now <= fiveAM {
            view.backgroundColor = .darkGray
        }
    }
    }

