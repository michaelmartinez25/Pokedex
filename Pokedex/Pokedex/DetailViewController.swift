//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/22/24.
//

import UIKit
import PokemonAPI

class DetailViewController: UIViewController {

    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var dexNumLabel: UILabel!
    
    @IBOutlet weak var typeOneImageView: UIImageView!
    @IBOutlet weak var typeTwoImageView: UIImageView!
    
    @IBOutlet weak var hpStatLabel: UILabel!
    @IBOutlet weak var atkStatLabel: UILabel!
    @IBOutlet weak var defStatLabel: UILabel!
    @IBOutlet weak var satkStatLabel: UILabel!
    @IBOutlet weak var sdefStatLabel: UILabel!
    @IBOutlet weak var speStatLabel: UILabel!
    @IBOutlet weak var totStatLabel: UILabel!
    
    @IBOutlet weak var hpStatProgressView: UIProgressView!
    @IBOutlet weak var atkStatProgressView: UIProgressView!
    @IBOutlet weak var defStatProgressView: UIProgressView!
    @IBOutlet weak var satkStatProgressView: UIProgressView!
    @IBOutlet weak var sdefStatProgressView: UIProgressView!
    @IBOutlet weak var speStatProgressView: UIProgressView!
    @IBOutlet weak var totStatProgressView: UIProgressView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let group = DispatchGroup()
        
        // Configure sprite image
        spriteImageView.image = UIImage(named: "\(pokemon.id!)")
        
        // Configure pokemon dex number
        dexNumLabel.text = "#\(pokemon.id!)"
        
        // Configure pokemon name
        pokemonNameLabel.text = pokemon.name!.capitalized
        
        // Configure pokemon typings
        var pkmnTypes: [String] = []
        for type in pokemon.types! {
            group.enter()
            PokemonAPI().resourceService.fetch(type.type!) {result in
                switch result {
                case .success(let pkmntype):
                    pkmnTypes.append(pkmntype.name!)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                group.leave()
            }
            group.wait()
        }
        typeOneImageView.image = UIImage(named: "\(pkmnTypes[0])")
        if (pkmnTypes.count == 2) {
            typeTwoImageView.image = UIImage(named: "\(pkmnTypes[1])")
        }
        
        // TODO: Configure pokemon stats
        let baseStatTotal: Float = 255
        let hpStat = pokemon.stats![0].baseStat!
        let atkStat = pokemon.stats![1].baseStat!
        let defStat = pokemon.stats![2].baseStat!
        let satkStat = pokemon.stats![3].baseStat!
        let sdefStat = pokemon.stats![4].baseStat!
        let speStat = pokemon.stats![5].baseStat!
        let totStat = hpStat + atkStat + defStat + satkStat + sdefStat + speStat
        
        hpStatLabel.text = "\(hpStat)"
        atkStatLabel.text = "\(atkStat)"
        defStatLabel.text = "\(defStat)"
        satkStatLabel.text = "\(satkStat)"
        sdefStatLabel.text = "\(sdefStat)"
        speStatLabel.text = "\(speStat)"
        totStatLabel.text = "\(totStat)"
        
        hpStatProgressView.setProgress((Float(hpStat) / baseStatTotal), animated: true)
        atkStatProgressView.setProgress((Float(atkStat) / baseStatTotal), animated: true)
        defStatProgressView.setProgress((Float(defStat) / baseStatTotal), animated: true)
        satkStatProgressView.setProgress((Float(satkStat) / baseStatTotal), animated: true)
        sdefStatProgressView.setProgress((Float(sdefStat) / baseStatTotal), animated: true)
        speStatProgressView.setProgress((Float(speStat) / baseStatTotal), animated: true)
        totStatProgressView.setProgress((Float(totStat) / (baseStatTotal * 6)), animated: true)
        
        
        // TODO: Configure pokemon flavor text
        
        
        // TODO: Configure pokemon abilities
        
    }

}
