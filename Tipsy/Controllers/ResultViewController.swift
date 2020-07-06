//
//  ResultViewController.swift
//  Tipsy
//
//  Created by muhammad.farisi on 11/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipPerPerson = 0.0
    var numberOfPerson = 0
    var tipPersentage = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", tipPerPerson)
        settingsLabel.text = "Split between \(numberOfPerson), with \(tipPersentage * 100)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
