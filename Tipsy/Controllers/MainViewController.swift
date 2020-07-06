//
//  MainViewController.swift
//  Tipsy
//
//  Created by muhammad.farisi on 11/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    var tipPct: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTip()
        
        
        print("1st stepper value: \(stepper.value)")
        
    }
    
    private func updateTip() {
        if zeroPctButton.isSelected {
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPct = 0.0
        } else if tenPctButton.isSelected {
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPct = 0.1
        } else if twentyPctButton.isSelected {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            tipPct = 0.2
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        updateTip()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String.init(Int.init(stepper.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResultViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultViewController" && sender is MainViewController {
            let resultController = segue.destination as! ResultViewController
            
            if let billText = billTextField.text {
                let bill = Double.init(billText) ?? 0.0
                let tip = bill * tipPct
                let totalBill = bill + tip
                let numberOfPerson = stepper.value
                let tipPerPerson = totalBill / numberOfPerson
                
                resultController.numberOfPerson = Int.init(numberOfPerson)
                resultController.tipPersentage = tipPct
                resultController.tipPerPerson = tipPerPerson
                
            }
        }
    }


}
