//
//  SimpleViewController.swift
//  Unit Testing
//
//  Created by Miguel Herrero on 12/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var simpleButton: UIButton!

    // MARK: - Variables

    var isSomethingVisible = false

    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()

        isSomethingVisible = true
        simpleButton?.backgroundColor = .blue
    }
}
