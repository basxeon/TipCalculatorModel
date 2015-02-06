//
//  ViewController.swift
//  TipCalculatorModel
//
//  Created by iStudents on 2/6/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var taxPactlabel: UILabel!
    @IBOutlet weak var resultTextview: UITextView!
    @IBOutlet weak var taxPactslider: UISlider!

    

    @IBAction func calculateTapped(sender: AnyObject){
        
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var result = ""
        
        var key = Array(possibleTips.keys)
        sort(&key)
        
        for (tipPct, tipValue) in possibleTips {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format: "%.2f", tipValue )
            result += "\(tipPct)%: \(prettyTipValue)\n"
        }
        resultTextview.text = result
    }
    
    @IBAction func taxPercentageChanged(sender: AnyObject) {
        tipCalc.taxPct = Double(taxPactslider.value)/100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI(){
        
        totalTextField.text = String(format: "%0.2f",tipCalc.total)
        
        taxPactslider.value = Float(tipCalc.taxPct) * 100.0
        
        taxPactlabel.text = "Tax Percentage (\(Int(taxPactslider.value))%)"
        resultTextview.text = ""
    
    }

}

