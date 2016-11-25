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
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var successImage: UIImageView!
    
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

        //Set all textFields delegates so we can use resignFirstResponder
        for textField in self.view.subviews where textField is UITextField {
            let textFieldItem = textField as! UITextField
            textFieldItem.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = !statePicker.isHidden
        countryLabel.isHidden = !countryLabel.isHidden
        countryTextField.isHidden = !countryTextField.isHidden
        zipLabel.isHidden = !zipLabel.isHidden
        zipTextField.isHidden = !zipTextField.isHidden
    }

    @IBAction func buyButtonPressed(_ sender: Any) {
        for view in self.view.subviews {
            view.isHidden = true
        }
        
        //Access to Success Imageview without declaring it as an IBOutlet
        self.view.viewWithTag(20)?.isHidden = false
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
