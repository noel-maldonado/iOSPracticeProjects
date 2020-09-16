//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Noel Maldonado on 8/5/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrentheitValue = fahrenheitValue {
            return fahrentheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CoversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }
    
    
    
    @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
        

        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "\(celsiusValue.value)"
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    
}

