//
//  ViewController.swift
//  Scroll the Page
//
//  Created by Miguel Herrero on 26/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        var contentWidth: CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            let newX: CGFloat = (scrollWidth / 2) + (scrollWidth * CGFloat(x))

            contentWidth += newX
            
            scrollView.addSubview(imageView)

            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }

        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

