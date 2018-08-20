//
//  ViewController.swift
//  GesturCalc
//
//  Created by David Sabzanov on 7/9/17.
//  Copyright © 2017 David Sabzanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var currentNumber: String = ""
    var performingMath = false;
    var operation = 0
    var prevOperation = 0
    var prevSenderTag = 0
    var opIsSet: Bool = false
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet var topRowOperatorButtons: [UIButton]!
    @IBOutlet var rightColumnOperatorButtons: [UIButton]!
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        clearButton.setTitle("C", for: .normal)
        
        if prevSenderTag == 16 {
            reset()
        }
        if sender.tag == 19 {
            if !(label.text?.contains("."))! {
                label.text = label.text! + "."
            }
            
        }
        if label.text == "0"
        {
            label.text = ""
        }
        
        if performingMath == true
        {
            if sender.tag != 19 {
                currentNumber = currentNumber + String(sender.tag - 1)
                //label.text = label.text! + String(sender.tag - 1) //sender.tag - 1 is the button tag - 1 which is the number you press in the app.
                label.text = currentNumber
                
                numberOnScreen = Double(label.text!)!
                //performingMath = false
            }
            else {
                if label.text == "0" {
                    currentNumber = currentNumber + "0."
                }
                else {
                    currentNumber = currentNumber + "."
                }
                label.text = currentNumber
                //label.text = label.text! + "0."
                //currentNumber = currentNumber + "."
                
                //numberOnScreen = Double(label.text!)!
                //performingMath = false
            }
            
            //label.text = formatForLabel(numberOnScreen)
        }

        else
        {
            if sender.tag != 19 {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!.replacingOccurrences(of: ",", with: ""))!
                /*if (label.text?.characters.count)! > 3 {
                    label.text = formatForLabel(Double(label.text!.replacingOccurrences(of: ",", with: ""))!)
                }*/
            }
            opIsSet = false
            previousNumber = Double(label.text!.replacingOccurrences(of: ",", with: ""))!
            
            //label.text = formatForLabel(numberOnScreen)
        }
        
        if !((label.text?.contains("."))! || ((label.text?.contains("."))! && label.text?.characters.last == "0")) {
            label.text = formatForLabel(numberOnScreen)
            //print(numberOnScreen)
        }
        prevSenderTag = sender.tag
        labelTextLengthLimiter()
    }
    
    @IBAction func functionButtons(_ sender: UIButton)
    {
        if prevSenderTag == 16 && sender.tag == 17 {
            numberOnScreen = Double(label.text!.replacingOccurrences(of: ",", with: ""))!
            performingMath = false
        }
        
        //prevSenderTag = sender.tag
        
        
        if sender.tag != 11 && sender.tag != 16 // Put back 'label.text != "0" &&' into condition if there are any bugs
        {
            if previousNumber != 0 && numberOnScreen != 0 && !(16...17 ~= sender.tag) && opIsSet == true {
                calculate()
            }
            /*
            else if previousNumber != 0 && numberOnScreen != 0 && sender.tag == 17 {
                calculate()
            }
            */
            if sender.tag != 17 {
            previousNumber = Double(label.text!.replacingOccurrences(of: ",", with: ""))!
                currentNumber = ""
            }
            
            
            if sender.tag == 12 //Divide
            {
                operatorLabel.text = "÷"
                operation = sender.tag
                performingMath = true
                opIsSet = true
            }
            else if sender.tag == 13 //Multiply
            {
                operatorLabel.text = "×"
                operation = sender.tag
                performingMath = true
                opIsSet = true

            }
            else if sender.tag == 14 //Minus
            {
                operatorLabel.text = "-"
                operation = sender.tag
                performingMath = true
                opIsSet = true

            }
            else if sender.tag == 15 //Plus
            {
                operatorLabel.text = "+"
                operation = sender.tag
                performingMath = true
                opIsSet = true

            }
            else if sender.tag == 17 //percentage
            {
                operatorLabel.text = "%"
                //operation = sender.tag
                
                if performingMath == true {
                    prevOperation = operation
                    operation = sender.tag
                    calculate()
                }
                else {
                    operation = sender.tag
                    calculate()
                }
                
                
                
                //calculate()
                //label.text = formatForLabel(previousNumber/100)
            }
            else if sender.tag == 18
            {
                previousNumber = -previousNumber
                label.text = formatForLabel(previousNumber)
            }
            
            
        }
        else if sender.tag == 16
        {
            operatorLabel.text = "="
            calculate()
            numberOnScreen = 0
            currentNumber = ""
            prevSenderTag = 16
            //performingMath = false
        }
        else if sender.tag == 11
        {
            reset()
        }
        prevSenderTag = sender.tag
    }
    
    
    // Press and Hold the Label view clears/resets all values.
    @IBAction func holdReset(_ sender: AnyObject) {
        reset()
    }
    
    /*
    // Shake device to clear/reset all values.
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            reset()
        }
    }
    */
    
    @IBAction func swipeDownLabel(_ sender: Any) {
        let swipedOperation = UIButton()
        swipedOperation.tag = 17
        functionButtons(swipedOperation)
    }
    
    @IBAction func swipeUpLabel(_ sender: Any) {
        let swipedOperation = UIButton()
        swipedOperation.tag = 18
        functionButtons(swipedOperation)
    }
    
    // Tap the Label view will display calculation
    @IBAction func tapEquals(_ sender: AnyObject) {
        operatorLabel.text = "="
        prevSenderTag = 16
        calculate()
        performingMath = false
    }
    
    // Swipe Right -> Add
    @IBAction func swipeRight(_ sender: AnyObject) {
        /*
        previousNumber = Double(label.text!)!
        operation = 15
        operatorLabel.text = "+"
        performingMath = true;
        */
        let swipedOperation = UIButton()
        swipedOperation.tag = 15
        functionButtons(swipedOperation)
    }
    
    // Swipe Left -> Subtract
    @IBAction func swipeLeft(_ sender: AnyObject) {
        /*
        previousNumber = Double(label.text!)!
        operation = 14
        operatorLabel.text = "-"
        performingMath = true;
        */
        let swipedOperation = UIButton()
        swipedOperation.tag = 14
        functionButtons(swipedOperation)
    }
    
    // Swipe Up -> Multiply
    @IBAction func swipeUp(_ sender: AnyObject) {
        /*
        previousNumber = Double(label.text!)!
        operation = 13
        operatorLabel.text = "×"
        performingMath = true;
        */
        let swipedOperation = UIButton()
        swipedOperation.tag = 13
        functionButtons(swipedOperation)
    }
    
    // Swipe Down -> Divide
    @IBAction func swipeDown(_ sender: AnyObject) {
        /*
        previousNumber = Double(label.text!)!
        operation = 12
        operatorLabel.text = "÷"
        performingMath = true;
        */
        let swipedOperation = UIButton()
        swipedOperation.tag = 12
        functionButtons(swipedOperation)
    }
    
    // Swipe Right or Left on Label to remove last digit
    @IBAction func removeLastDigit(_ sender: AnyObject) {
        if (label.text?.characters.count)! > 1 {
            if label.text?.characters.last == "." {
                label.text?.characters.removeLast()
            }
            else {
                label.text = label.text!.replacingOccurrences(of: ",", with: "")
                label.text?.characters.removeLast()
                label.text = formatForLabel(Double(label.text!)!)
                numberOnScreen = Double(label.text!.replacingOccurrences(of: ",", with: ""))!
            }
        }
        else {
            numberOnScreen = 0
            label.text = formatForLabel(numberOnScreen)
        }
    }
    
    
    
    // Reset/Clear
    func reset() {
        operatorLabel.text = ""
        label.text = "0"
        previousNumber = 0
        numberOnScreen = 0
        currentNumber = ""
        operation = 0
        prevSenderTag = 0
        performingMath = false
        clearButton.setTitle("AC", for: .normal)
    }
    
    func calculate() {
        if operation == 12
        {
            numberOnScreen = previousNumber / numberOnScreen
            label.text = formatForLabel(numberOnScreen)
        }
        else if operation == 13
        {
            numberOnScreen = previousNumber * numberOnScreen
            label.text = formatForLabel(numberOnScreen)
        }
        else if operation == 14
        {
            previousNumber = previousNumber - numberOnScreen
            label.text = formatForLabel(previousNumber)
        }
        else if operation == 15
        {
            previousNumber = previousNumber + numberOnScreen
            label.text = formatForLabel(previousNumber)
        }
        else if operation == 17
        {
            
            if performingMath == true {
                if prevOperation == 12 || prevOperation == 13 {
                    numberOnScreen = numberOnScreen/100
                    label.text = formatForLabel(numberOnScreen)
                }
                else if prevOperation == 14 || prevOperation == 15 {
                    numberOnScreen = previousNumber * (numberOnScreen/100)
                    label.text = formatForLabel(numberOnScreen)
                }
                operation = prevOperation
                prevOperation = 0
            }
            else {
                previousNumber = numberOnScreen
                previousNumber = previousNumber/100
                label.text = formatForLabel(previousNumber)
                numberOnScreen = previousNumber
            }
        }
        
    }

    
    func formatForLabel(_ value: Double) -> String {
        var formattedNumber: String
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.usesSignificantDigits = false
        
        //numberFormatter.string(for: value)
        //numberFormatter.minimumSignificantDigits = 0
        
 
        let NSlargeNumber: NSNumber = numberFormatter.number(from: "\(value)")!
        
        //let largeNumber = numberFormatter.string(for: value)
        //let largeNumber = String(value)
        
        let largeNumber: String = String(describing: NSlargeNumber)
        
        /*
        print("Value: \(value)")
        print("NSlargeNumber: \(NSlargeNumber)")
        print("largeNumber: \(largeNumber)")
        */
        
        if (largeNumber.contains(".")) {
            let valuesSplitByDecimal: [String] = largeNumber.components(separatedBy: ".")
            
            //let leftHalf = numberFormatter.string(from: NSNumber(value: Double((valuesSplitByDecimal[0]))!))
            //let leftHalfInt = Int((valuesSplitByDecimal[0]))
            //let leftHalf = numberFormatter.string(from: NSNumber(value: leftHalfInt!))
            
            let stringLeftHalf: String = valuesSplitByDecimal[0]
            //print("stringLeftHalf: \(stringLeftHalf)")
            let intLeftHalf: Int = Int(stringLeftHalf)!
            //print("intLeftHalf: \(intLeftHalf)")
            let leftHalf = numberFormatter.string(from: NSNumber(value: intLeftHalf))
            var rightHalf = valuesSplitByDecimal[1]
            
            while rightHalf.characters.last == "0" {
                rightHalf.characters.removeLast()
            }
            
            if (rightHalf.characters.count) > 0 {
                formattedNumber = leftHalf! + "." + rightHalf
            }
            else {
                formattedNumber = leftHalf!
            }
        }
        else {
            formattedNumber = numberFormatter.string(from: NSNumber(value: value))!
        }
 
        return formattedNumber
    }
 
    func labelTextLengthLimiter() {
        let labelLength = label.text?.characters.count
        let labelText: String = label.text!

        //print(label.text)
        
        
        if (labelText.components(separatedBy: ",").count) - 1 == 3 {
            if (!labelText.contains(".") && labelLength! > 11) {
                removeLastDigit(labelLength as AnyObject)
            }
        }
        else if (labelText.components(separatedBy: ",").count) - 1 == 2 {
            if (labelText.contains(".") && (labelLength! > 12)) {
                removeLastDigit(labelLength as AnyObject)
            }
            else if (!labelText.contains(".") && labelLength! > 11) {
                removeLastDigit(labelLength as AnyObject)
            }
        }
        else if (labelText.components(separatedBy: ",").count) - 1 == 1 {
            if labelLength! > 11 {
                removeLastDigit(labelLength as AnyObject)
            }
        }
        else if (labelText.components(separatedBy: ",").count) - 1 == 0 {
            if labelLength! > 10 {
                removeLastDigit(labelLength as AnyObject)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0"
        
       
        //topRowOperatorButtons.forEach({$0.addBorder(side: .bottom, thickness: 2, color: UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0) )})
        
        //rightColumnOperatorButtons.forEach({$0.addBorder(side: .left, thickness: 2, color: UIColor(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.0))})
        
        //addBorder(side: .bottom, thickness: 2, color: .orange)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
/*
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
*/
