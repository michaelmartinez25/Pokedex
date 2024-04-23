//
//  Pokemon.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/16/24.
//

import UIKit
import PokemonAPI

struct PokemonList: Decodable {
    let pokemonList: [Pokemon]
}

struct Pokemon: Codable {
    
    /// The identifier for this Pokémon resource
    var id: Int?
        
    /// The name for this Pokémon resource
    var name: String?
        
    /// The base experience gained for defeating this Pokémon
    var baseExperience: Int?
        
    /// The height of this Pokémon
    var height: Int?
        
    /// Set for exactly one Pokémon used as the default for each species
    var isDefault: Bool?
        
    /// Order for sorting. Almost national order, except families are grouped together.
    var order: Int?
        
    /// The weight of this Pokémon
    var weight: Int?
        
    /// A list of abilities this Pokémon could potentially have
    var abilities: [PKMPokemonAbility]?
        
    /// A list of forms this Pokémon can take on
    var forms: [PKMNamedAPIResource<PKMPokemonForm>]?
        
    /// A list of game indices relevent to Pokémon item by generation
    var gameIndices: [PKMVersionGameIndex]?
        
    /// A list of items this Pokémon may be holding when encountered
    var heldItems: [PKMPokemonHeldItem]?
        
    /// A list of location areas as well as encounter details pertaining to specific versions
    var locationAreaEncounters: String?
        
    /// A list of moves along with learn methods and level details pertaining to specific version groups
    var moves: [PKMPokemonMove]?
        
    /// A set of sprites used to depict this Pokémon in the game
    var sprites: PKMPokemonSprites?
        
    /// The species this Pokémon belongs to
    var species: PKMNamedAPIResource<PKMPokemonSpecies>?
        
    /// A list of base stat values for this Pokémon
    var stats: [PKMPokemonStat]?
        
    /// A list of details showing types this Pokémon has
    var types: [PKMPokemonType]?
    
    init(id: Int? = nil, name: String? = nil, baseExperience: Int? = nil, height: Int? = nil, isDefault: Bool? = nil, order: Int? = nil, weight: Int? = nil, abilities: [PKMPokemonAbility]? = nil, forms: [PKMNamedAPIResource<PKMPokemonForm>]? = nil, gameIndices: [PKMVersionGameIndex]? = nil, heldItems: [PKMPokemonHeldItem]? = nil, locationAreaEncounters: String? = nil, moves: [PKMPokemonMove]? = nil, sprites: PKMPokemonSprites? = nil, species: PKMNamedAPIResource<PKMPokemonSpecies>? = nil, stats: [PKMPokemonStat]? = nil, types: [PKMPokemonType]? = nil) {
        self.id = id
        self.name = name
        self.baseExperience = baseExperience
        self.height = height
        self.isDefault = isDefault
        self.order = order
        self.weight = weight
        self.abilities = abilities
        self.forms = forms
        self.gameIndices = gameIndices
        self.heldItems = heldItems
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.sprites = sprites
        self.species = species
        self.stats = stats
        self.types = types
    }
}


