//
//  DetailViewController.swift
//  TDD_Project
//
//  Created by Miguel Herrero on 14/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
}
