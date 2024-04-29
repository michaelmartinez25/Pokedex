//
//  SnapshotViewController.swift
//  Pokedex
//
//  Created by Michael Martinez on 4/15/24.
//

import UIKit
import GoogleGenerativeAI
import PokemonAPI

class SnapshotViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoCaptureButton: UIButton!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var segueButton: UIButton!
    
    let model = GenerativeModel(name: "gemini-pro-vision", apiKey: APIKey.default)
    private var capturedPhoto: UIImage? = nil
    private var pokemonString: String = ""
    private var pokemonInPhoto: Pokemon!
    
    let emptyPokemon: Pokemon = Pokemon(id: nil, name: nil, baseExperience: nil, height: nil, isDefault: nil, order: nil, weight: nil, abilities: nil, forms: nil, gameIndices: nil, heldItems: nil, locationAreaEncounters: nil, moves: nil, sprites: nil, species: nil, stats: nil, types: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photoCaptureButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing for segue.")
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        detailViewController.pokemon = pokemonInPhoto
    }
    
    @objc func openCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false // Set to true if you want to allow editing
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        openCamera()
    }
    
    @IBAction func generate(_ sender: Any) {
        Task {
            let prompt = "Simply name this Pokemon. For example, if the pokemon in the image is Pikachu, return 'Pikachu'. If there does not appear to be a Pokemon in the image, simply respond with 'Try again.'"
            
            do {
                let response = try await model.generateContent(prompt, capturedPhoto!)
                if let text = response.text {
                    let space = text.firstIndex(of: " ")!
                    pokemonString = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                    print("[\(pokemonString)]")
                }
                
                if (!pokemonString.elementsEqual("Try again.")) {
                    print("Attempting to identify Pokemon.")
                    identifyPokemon()
                } else {
                    pokemonInPhoto.name = "Failed to load, try again."
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            capturedPhoto = image
            displayImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func identifyPokemon() {
        let group = DispatchGroup()
        pokemonInPhoto = emptyPokemon
        group.enter()
        PokemonAPI().pokemonService.fetchPokemon(pokemonString) {result in
            switch result {
            case .success(let pkmn):
                print("\(String(describing: pkmn.name)) successfully loaded. Now filling in variables...")
                self.pokemonInPhoto.id = pkmn.id
                self.pokemonInPhoto.name = pkmn.name
                self.pokemonInPhoto.baseExperience = pkmn.baseExperience
                self.pokemonInPhoto.height = pkmn.height
                self.pokemonInPhoto.isDefault = pkmn.isDefault
                self.pokemonInPhoto.order = pkmn.order
                self.pokemonInPhoto.weight = pkmn.weight
                self.pokemonInPhoto.abilities = pkmn.abilities
                self.pokemonInPhoto.forms = pkmn.forms
                self.pokemonInPhoto.gameIndices = pkmn.gameIndices
                self.pokemonInPhoto.heldItems = pkmn.heldItems
                self.pokemonInPhoto.locationAreaEncounters = pkmn.locationAreaEncounters
                self.pokemonInPhoto.moves = pkmn.moves
                self.pokemonInPhoto.sprites = pkmn.sprites
                self.pokemonInPhoto.species = pkmn.species
                self.pokemonInPhoto.stats = pkmn.stats
                self.pokemonInPhoto.types = pkmn.types
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        group.wait()
        print("Successfully loaded \(pokemonInPhoto.name!)")
    }
}
