//
//  ViewController.swift
//  Aim For That
//
//  Created by Miguel Herrero on 21/7/17.
//  Copyright © 2017 Miguel Herrero. All rights reserved.
//

import UIKit
import QuartzCore

class GameViewController: UIViewController {

    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    var time         : Int = 0
    var timer        : Timer?
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var maxScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSlider()
        resetGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackRightImage = UIImage(named: "SliderTrackRight")
        
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        self.slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        
        self.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        self.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        self.view.layer.add(transition, forKey: nil)
    }
    
    func resetGame() {
        var maxScore = UserDefaults.standard.integer(forKey: "maxScore")
        
        if maxScore < self.score {
            maxScore = self.score
            UserDefaults.standard.set(maxScore, forKey: "maxScore")
        }

        self.maxScore.text = "\(maxScore)"
        self.score = 0
        self.round = 0
        self.time = 60
        
        if self.timer != nil {
            self.timer?.invalidate()
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        self.updateLabels()
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
        self.timeLabel.text = "\(self.time)"
    }
    
    @objc func tick() {
        self.time -= 1
        self.timeLabel.text = "\(self.time)"
        
        if self.time <= 0 {
            self.resetGame()
        }
    }
}

