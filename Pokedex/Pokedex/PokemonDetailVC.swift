//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Miguel Herrero on 17/12/16.
//  Copyright © 2016 Miguel Herrero. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name

    }

}
