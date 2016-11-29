//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Miguel Herrero on 28/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buttonSound: AVAudioPlayer!

    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load sound and prepare an AV player for it
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        outputLabel.text = ""
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(operation: .Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
    }

    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(operation: .Subtract)
    }

    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }

    /** Play button sound if is not already playing */
    func playSound() {
        /*if buttonSound.isPlaying {
            buttonSound.stop()
        }
        
        buttonSound.play()*/
    }
    
    func processOperation(operation: Operation) {
        playSound()
        
        // We have pressed something
        if currentOperation != Operation.Empty {
            // We have pressed a number key
            // A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                
                leftValString = result
                outputLabel.text = result
            }
            
            currentOperation = operation
        } else {
            // This is the first time an operator has been pressed
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}

