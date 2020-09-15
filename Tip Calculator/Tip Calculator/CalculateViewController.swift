//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Noel Maldonado on 9/15/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var billTotal: Double?
    var tipPct: Double?
    var split: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender {
        case zeroPctButton:
            zeroPctButton.isSelected = true
            tipPct = 1.0
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            tenPctButton.isSelected = true
            tipPct = 1.1
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case twentyPctButton:
            twentyPctButton.isSelected = true
            tipPct = 1.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        default:
            tipPct = 1.0
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
//        print("Tip Percentage : \(tipPct!)")
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard billTotal != nil else {
            print("guard")
            return
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(sender.value)
        split = sender.value
//        print("Split: \(split!)")
    }
    
    @IBAction func billAmountChanged(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty {
            billTotal = Double(text)
        } else {
            print("Bill textField error")
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
           //create a reference to new view Controller
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = String(format: "%.2f",((billTotal! * tipPct!) / split!))
            destinationVC.settingsMessage = "Split between \(Int(split!)) people, with \(Int(((tipPct! - 1) * 100).rounded()))% tip."
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        billTextField.resignFirstResponder()
//        if billTotal != nil {
//            print("Bill Total: \(billTotal!)")
//        }
    }
    
}

