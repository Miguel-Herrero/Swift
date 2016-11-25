//
//  ViewController.swift
//  Miracle Pills
//
//  Created by Miguel Herrero on 25/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pillImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
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
        
        self.zipTextField.delegate = self
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
        pillImage.isHidden = true
        titleLabel.isHidden = true
        subtitleLabel.isHidden = true
        dividerView.isHidden = true
        nameLabel.isHidden = true
        nameTextField.isHidden = true
        addressLabel.isHidden = true
        addressTextField.isHidden = true
        cityLabel.isHidden = true
        cityTextField.isHidden = true
        stateLabel.isHidden = true
        statePicker.isHidden = true
        statePickerButton.isHidden = true
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        zipLabel.isHidden = true
        zipTextField.isHidden = true
        buyButton.isHidden = true
        
        successImage.isHidden = false
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true;
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
