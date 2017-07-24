//
//  ViewController.swift
//  Aim For That
//
//  Created by Miguel Herrero on 21/7/17.
//  Copyright © 2017 Miguel Herrero. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue:  Int = 0
    var score:        Int = 0
    var round:         Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let difference: Int = abs(self.currentValue - self.targetValue)
        
        // Puntos lineales
        //var points = (difference > 0) ? 100 - difference : 1000
        var points = 100 - difference
        let title: String
        
        switch difference {
        case 0:
            title = "Puntuación perfecta"
            points = Int(10.0 * Float(points))
        case 1...5:
            title = "Casi perfecto"
            points = Int(1.5 * Float(points))
        case 6...12:
            title = "Te ha faltado poco"
            points = Int(1.2 * Float(points))
        default:
            title = "Has sido lejos…"
        }
        
        self.score += points

        let message = "Has marcado \(points) puntos!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startNewRound()
            self.updateLabels()
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("El valor del slider es \(sender.value)")
        self.currentValue = lroundf(sender.value)
    }
    
    @IBAction func startNewGame() {
        resetGame()
        updateLabels()
    }
    
    func resetGame() {
        self.score = 0
        self.round = 0
        self.startNewRound()
    }
    
    func startNewRound() {
        self.targetValue = 1 + Int(arc4random_uniform(100))
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.round += 1
    }
    
    func updateLabels() {
        self.targetLabel.text = "\(self.targetValue)"
        self.scoreLabel.text = "\(self.score)"
        self.roundLabel.text = "\(self.round)"
    }
}

