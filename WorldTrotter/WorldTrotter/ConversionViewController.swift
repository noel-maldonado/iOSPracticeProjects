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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CoversionViewController loaded its view.")
    }
    
    @IBAction func farenheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
        
        
        //if textfield has text and text is not empty it will set text to celsiusLabel
        //comma acts like an 'and'
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
        
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
}

