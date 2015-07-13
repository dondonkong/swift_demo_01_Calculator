//
//  ViewController.swift
//  Calculator
//
//  Created by Donte on 15/7/6.
//  Copyright (c) 2015年 Donte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    
    var firstOperand: Double = 0.0
    var secondOperand: Double = 0.0
    var decimalPointFlag: Bool = false
    var isSecond: Bool = false
    var operatorFlag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTap(sender: UIButton) {
        // clear the result label
        if labelResult.text == "0" || (isSecond && secondOperand == 0.0) {
            labelResult.text = ""
        }
        
        // while pressing the number button, update result label
        if let value = sender.titleLabel?.text {
            labelResult.text = labelResult.text! + value
        }
        
        // convert result from string to double
        if isSecond {
            secondOperand = (labelResult.text! as NSString).doubleValue
        } else {
            firstOperand = (labelResult.text! as NSString).doubleValue
        }
        
        // print to check
        //println(firstOperand)
    }

    @IBAction func decimalPointTap() {
        if !decimalPointFlag {
            labelResult.text = labelResult.text! + "."
            
            if isSecond {
                secondOperand = NSString(string: labelResult.text!).doubleValue
            } else {
                firstOperand = NSString(string: labelResult.text!).doubleValue
            }
            
            decimalPointFlag = !decimalPointFlag
        }
    }
    
    @IBAction func operatorTap(sender: UIButton) {
        if firstOperand != 0 {
            isSecond = true
            decimalPointFlag = false
            
            switch sender.titleLabel!.text! {
                case "+":
                    operatorFlag = "+"
                case "-":
                    operatorFlag = "-"
                case "*":
                    operatorFlag = "*"
                case "/":
                    operatorFlag = "/"
                default:
                    operatorFlag = ""
            }
        }
    }
    
    @IBAction func resultTap() {
        if isSecond {
            if operatorFlag == "/" && secondOperand == 0 {
                println("Error: divided by zero")
                return
            }
            
            var result : Double = 0.0
            switch operatorFlag {
                case "+":
                    result = firstOperand + secondOperand
                case "-":
                    result = firstOperand - secondOperand
                case "*":
                    result = firstOperand * secondOperand
                case "/":
                    result = firstOperand / secondOperand
                default:
                    result = 0.0
            }
            
            labelResult.text = result.description
            
            // print to check
            println("\(firstOperand) \(operatorFlag) \(secondOperand) = \(result)")
        }
    }
    
    @IBAction func clearResult(sender: UIButton) {
        labelResult.text = "0"
        firstOperand = 0.0
        secondOperand = 0.0
        decimalPointFlag = false
        isSecond = false
        operatorFlag = ""
    }
    
}

