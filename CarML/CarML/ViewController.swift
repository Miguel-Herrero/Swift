//
//  ViewController.swift
//  CarML
//
//  Created by Miguel Herrero on 27/7/17.
//  Copyright © 2017 Miguel Herrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var extrasSwitch: UISwitch!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var kmSlider: UISlider!
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var priceLabel: UILabel!
    
    let cars = Cars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calculateValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateValue() {
        
        // Formatear el valor del slider de Km
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedKm = formatter.string(for: self.kmSlider.value) ?? "0"
        self.kmLabel.text = "Kilometraje: \(formattedKm)"
        
        // Hacer el cálculo del precio
        if let prediction = try? cars.prediction(modelo: Double(self.modelSegmentedControl.selectedSegmentIndex),
                                                 extras: self.extrasSwitch.isOn ? Double(1.0) : Double(0.0),
                                                 kilometraje: Double(self.kmSlider.value),
                                                 estado: Double(self.statusSegmentedControl.selectedSegmentIndex)) {
            
            // No vender por debajo de 500
            let clampValue = max(500, prediction.price)
            
            formatter.numberStyle = .currency
            self.priceLabel.text = formatter.string(for: clampValue)
        } else {
            self.priceLabel.text = "Error"
        }
    }
    
    
}

