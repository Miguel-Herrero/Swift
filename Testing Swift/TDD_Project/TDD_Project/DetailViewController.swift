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
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
}
