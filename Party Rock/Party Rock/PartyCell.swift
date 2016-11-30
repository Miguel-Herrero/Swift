//
//  PartyCell.swift
//  Party Rock
//
//  Created by Miguel Herrero on 30/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        //TODO: Set image from URL
        
        let url = URL(string: partyRock.imageURL)!

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)

                DispatchQueue.main.async {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                /* Showed in the video; wrong UI update
                 DispatchQueue.global().async {
                    self.videoPreviewImage.image = UIImage(data: data)
                }*/
            } catch {
                //Handle the error
            }
        }
    }

}
