//
//  ResultsViewController.swift
//  tipsy
//
//  Created by Investo Medika Asia on 14/12/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var descText: String = ""
    var resultText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultText
        descLabel.text = descText
        
    }
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
