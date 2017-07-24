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

        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let difference: Int = abs(self.currentValue - self.targetValue)
        
        // Puntos lineales
        let points = (difference > 0) ? 100 - difference : 1000
        
        self.score += points
        
        
        let message = """
            Has marcado \(points) puntos!
"""

        let alert = UIAlertController(title: "Hola mundo", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Genial", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)

        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("El valor del slider es \(sender.value)")
        self.currentValue = lroundf(sender.value)
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

