//
//  ViewController.swift
//  Project Red
//
//  Created by Aaron Suarez on 1/24/20.
//  Copyright © 2020 Aaron Suarez. All rights reserved.
//

import UIKit
import RealmSwift

class CounterViewController: UIViewController {
    let realm = try! Realm()
    var pokemon: Pokemon? {
        didSet {
            loadPokemon()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadPokemon() {
        if pokemon != nil {
            nameLabel.text = pokemon?.name
            countLabel.text = String(pokemon!.count)
            addButton.isEnabled = true
            minusButton.isEnabled = true
        }
    }
    
    @IBAction func selectPokemon(_ unwindSegue: UIStoryboardSegue) {
        if let pokedexVC = unwindSegue.source as? PokedexViewController {
            pokemon = pokedexVC.selectedPokemon
        }
    }
    
    @IBAction func pokedexButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPokedex", sender: self)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if var count = Int(countLabel.text!) {
            count += 1
            countLabel.text = String(count)
            updatePokemonCount(count)
        }
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        if var count = Int(countLabel.text!) {
            if count > 0 {
                count -= 1
                countLabel.text = String(count)
                updatePokemonCount(count)
            }
        }
    }
    
    func updatePokemonCount(_ count: Int) {
        if let safePokemon = pokemon {
            do {
                try realm.write {
                    safePokemon.count = count
                }
            } catch {
                print("Error saving count, \(error)")
            }
        }
    }
}

