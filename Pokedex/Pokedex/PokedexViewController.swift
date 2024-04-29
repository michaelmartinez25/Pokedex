//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/15/24.
//

import UIKit
import PokemonAPI

class PokedexViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var pokemonEntries: [PKMPokemonEntry] = []
    private var pokedex: [Pokemon] = []
    let emptyPokemon: Pokemon = Pokemon(id: nil, name: nil, baseExperience: nil, height: nil, isDefault: nil, order: nil, weight: nil, abilities: nil, forms: nil, gameIndices: nil, heldItems: nil, locationAreaEncounters: nil, moves: nil, sprites: nil, species: nil, stats: nil, types: nil)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        
        let pokemon = pokedex[indexPath.row]
        
        cell.spriteImageView.image = UIImage(named: "\(pokemon.id!)")
        cell.pokemonNameLabel.text = pokemon.name!.capitalized
        cell.dexNumLabel.text = "\(pokemon.id!)"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        fillPokedex()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let selectedPokemon = pokedex[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        detailViewController.pokemon = selectedPokemon
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // get the index path for the selected row
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            
            // Deselect the currently selected row
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    private func fillPokedex() {
        let group = DispatchGroup()
        // Part 1
        var temp: [PKMPokemonEntry] = []
        group.enter()
        PokemonAPI().gameService.fetchPokedex(2) {result in
            switch result {
            case .success(let entries):
                temp = entries.pokemonEntries!
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            group.leave()
        }
        
        group.wait()
        
        self.pokemonEntries = temp
        
        // Part 2
        var counter = 0
        for entry in pokemonEntries {
            var pokemon = emptyPokemon
            group.enter()
            PokemonAPI().pokemonService.fetchPokemon(entry.entryNumber!) {result in
                switch result {
                case .success(let pkmn):
                    pokemon.id = pkmn.id
                    pokemon.name = pkmn.name
                    pokemon.baseExperience = pkmn.baseExperience
                    pokemon.height = pkmn.height
                    pokemon.isDefault = pkmn.isDefault
                    pokemon.order = pkmn.order
                    pokemon.weight = pkmn.weight
                    pokemon.abilities = pkmn.abilities
                    pokemon.forms = pkmn.forms
                    pokemon.gameIndices = pkmn.gameIndices
                    pokemon.heldItems = pkmn.heldItems
                    pokemon.locationAreaEncounters = pkmn.locationAreaEncounters
                    pokemon.moves = pkmn.moves
                    pokemon.sprites = pkmn.sprites
                    pokemon.species = pkmn.species
                    pokemon.stats = pkmn.stats
                    pokemon.types = pkmn.types
                case .failure(let error):
                    print(error.localizedDescription)
                }
                group.leave()
            }
            group.wait()
            
            pokedex.append(pokemon)
            print("\(pokedex[counter].name!) has been added to the Pokedex.")
            counter += 1
        }
        
        print("Pokedex filled.")
    }

}
