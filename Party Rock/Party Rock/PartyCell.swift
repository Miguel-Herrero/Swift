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

        // Background thread asynchronously (https://www.youtube.com/watch?v=-xnt70_gMqQ)
        DispatchQueue.global(qos: .background).async {[weak self] in
            
            let url = URL(string: partyRock.imageURL)!
            
            do {
                let data = try Data(contentsOf: url)

                DispatchQueue.main.async {[weak self] in
                    self?.videoPreviewImage.image = UIImage(data: data)
                }
            } catch let error {
                debugPrint(error)
            }
        }
        
        
    }

}
