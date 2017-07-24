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
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.currentValue = lroundf(self.slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hola mundo", message: "El valor del slider es \(self.currentValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Genial", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("El valor del slider es \(sender.value)")
        self.currentValue = lroundf(sender.value)
    }
}

