//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/15/24.
//

import UIKit
import Foundation

class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var dexNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
