//
//  PlaySongVC.swift
//  SwappingScreens
//
//  Created by Miguel Herrero on 26/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class PlaySongVC: UIViewController {

    @IBOutlet var songTitleLabel: UILabel!
    
    private var _selectedSong: String!
    
    var selectedSong: String {
        set { _selectedSong = newValue }
        get { return _selectedSong }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        songTitleLabel.text = _selectedSong
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
