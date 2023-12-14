//
//  ViewController.swift
//  tipsy
//
//  Created by Investo Medika Asia on 14/12/23.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextfield: UITextField!
    var tip: Double = 0.1
    var numberOfPeople = 2
    var billTotal: Double = 0.0
    var resultBill: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func splitChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextfield.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTittle = sender.titleLabel?.text?.dropLast()
        tip = Double(buttonTittle!)! / 100
        
    }
    
    @IBAction func billPressed(_ sender: Any) {

    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let bill = billTextfield.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = (Double(bill)! * (1 + tip)) / Double(numberOfPeople)
            let resultTo2DecimalPlace = String(format: "%.2f", result)
            resultBill = resultTo2DecimalPlace
            
            self.performSegue(withIdentifier: "toDetail", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let segue = segue.destination as! ResultsViewController
            segue.descText = "Split between \(numberOfPeople) people, with \(tip * 100)% tip."
            segue.resultText = resultBill
        }
    }
}

