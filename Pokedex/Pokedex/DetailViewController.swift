//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/22/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        // TODO: Configure sprite image
        spriteImageView.image = UIImage(named: "\(pokemon.id!)")
        // TODO: Configure pokemon dex number
        
        // TODO: Configure pokemon name
        pokemonNameLabel.text = pokemon.name!.capitalized
        // TODO: Configure pokemon typings
        
        // TODO: Configure pokemon
        
        // TODO: Configure pokemon flavor text
        
        // TODO: Configure pokemon abilities
        
        // TODO: Configure pokemon stats
        
    }

}
