//
//  ViewController.swift
//  DoCalc
//
//  Created by Ravi Pinamacha on 7/25/17.
//  Copyright © 2017 Ravi Pinamacha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var btnSound : AVAudioPlayer!
    var numberOnScreen :Double = 0
    var firstNumber :Double = 0
    var performngMath = false
    var operation = 0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "button1", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        do{
            
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
     
        
    }
    
    
    @IBAction func handleButtonPress(_ sender: UIButton) {
        if performngMath == true {
            resultLabel.text = String(sender.tag)
            numberOnScreen = Double(resultLabel.text!)!
            performngMath = false
        } else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
            numberOnScreen = Double(resultLabel.text!)!
        }
   
    }
    @IBAction func btns(_ sender: AnyObject) {
    
        if resultLabel.text != "" &&  sender.tag != 11 &&  sender.tag != 17 &&  sender.tag != 12  {
            firstNumber = Double(resultLabel.text!)!
            if  sender.tag == 13 {//minus
                resultLabel.text = "-"
            }
            else  if  sender.tag == 14 {//plus
                resultLabel.text = "+"
            }
            else  if  sender.tag == 15 {//divide
                resultLabel.text = "/"
            }
            else  if  sender.tag == 16 {//multipluy
                resultLabel.text = "*"
            }
            operation = sender.tag
            performngMath = true
            
        } else if sender.tag == 17 {
            print(firstNumber)
            print(numberOnScreen)
            print(operation)
            if operation == 13 {
                resultLabel.text = String(firstNumber - numberOnScreen)
            }
            else if operation == 14 {
                    resultLabel.text = String(firstNumber + numberOnScreen)
            }
            else if operation == 15 {
                resultLabel.text = String(firstNumber / numberOnScreen)
            }
            else if operation == 16 {
                resultLabel.text = String(firstNumber * numberOnScreen)
            }
            
        }  else if sender.tag == 12 {
            if resultLabel.text != ""{
                let labelText = resultLabel.text
            resultLabel.text = labelText?.substring(to: (labelText?.index(before: (labelText?.endIndex)!))!)
            }
        }
        else if sender.tag == 11 {
            resultLabel.text = ""
            firstNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        else if sender.tag == 10{
            
            
            resultLabel.text = "."
            
            
            
        }
    }
  }
