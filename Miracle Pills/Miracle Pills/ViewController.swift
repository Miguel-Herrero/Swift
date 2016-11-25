//
//  ViewController.swift
//  Miracle Pills
//
//  Created by Miguel Herrero on 25/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    
    let states = [
        "Alaska",
        "Arkansas",
        "Alabama",
        "California",
        "Maine",
        "New York"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        statePicker.delegate = self
        statePicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = !statePicker.isHidden
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
    }
}
