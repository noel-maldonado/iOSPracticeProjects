//
//  ResultViewController.swift
//  Tip Calculator
//
//  Created by Noel Maldonado on 9/15/20.
//  Copyright © 2020 Noel Maldonado. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var settingsMessage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total!
        settingsLabel.text = settingsMessage!
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        total = nil
        settingsMessage = nil
        dismiss(animated: true, completion: nil)
    }
    
}
