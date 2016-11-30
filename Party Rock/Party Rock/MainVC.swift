//
//  MainVC.swift
//  Party Rock
//
//  Created by Miguel Herrero on 30/11/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var partyRocks = [PartyRock]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i3.ytimg.com/vi/UqyT8IEBkvY/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UqyT8IEBkvY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Bruno Mars - 24K Magic")
        
        let p2 = PartyRock(imageURL: "https://i3.ytimg.com/vi/3AtDnEC4zak/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3AtDnEC4zak\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Charlie Puth - We Don't Talk Anymore")
        
        let p3 = PartyRock(imageURL: "https://i3.ytimg.com/vi/GKSRyLdjsPA/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/GKSRyLdjsPA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sia - The Greatest")
        
        let p4 = PartyRock(imageURL: "https://i3.ytimg.com/vi/kOkQ4T5WO9E/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kOkQ4T5WO9E\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Calvin Harris - This Is What You Came For")
        
        let p5 = PartyRock(imageURL: "https://i3.ytimg.com/vi/hdw1uKiTI5c/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/hdw1uKiTI5c\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Katy Perry - Rise")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            // Instead of updating the UI here, pass all the data to the cell View
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
