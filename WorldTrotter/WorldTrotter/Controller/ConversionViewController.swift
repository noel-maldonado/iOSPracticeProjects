//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Noel Maldonado on 8/5/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
// From the Book by BiGNerdRanch

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

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
    //using a closure to instantiate the number formatter
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CoversionViewController loaded its view.")
        
        updateCelsiusLabel()
//        self.view.backgroundColor = randomBackgroundColor()

    }
    
    
    
    @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
        

        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeperator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeperator != nil, replacementTextHasDecimalSeperator != nil {
                return false
            } else {
            return true
        }
        
    }

    //Silver Challenge: Different Background Colors | Chapter 4
//    func randomBackgroundColor() -> UIColor {
//        let colors: [UIColor] = [.cyan, .darkGray, .gray, .blue, .orange, .brown, .green, .purple, .magenta]
//        return colors.randomElement()!
//    }
    
    
    //    Silver Challenge | Chapter 3
    //    func createGradientLayer() -> CALayer {
    //        layer = CAGradientLayer()
    //        layer.colors = [UIColor.black.cgColor, UIColor.gray.cgColor,UIColor.white.cgColor, UIColor.black.cgColor]
    //        return layer
    //    }
    
}

