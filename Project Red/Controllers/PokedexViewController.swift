//
//  PokedexTableViewController.swift
//  Project Red
//
//  Created by Aaron Suarez on 1/24/20.
//  Copyright © 2020 Aaron Suarez. All rights reserved.
//

import UIKit
import RealmSwift

class PokedexViewController: UITableViewController {
    let realm = try! Realm()
    var pokemon: Results<Pokemon>?
    var selectedPokemon: Pokemon?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPokemon()
    }
    
    func loadPokemon() {
        pokemon = realm.objects(Pokemon.self)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = tableView.indexPathForSelectedRow?.row, let pokemon = pokemon?[row] {
            selectedPokemon = pokemon
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemon = pokemon?[indexPath.row] {
            selectedPokemon = pokemon
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokedexCell", for: indexPath)
        let pkmn = pokemon?[indexPath.row]
        cell.textLabel?.text = pkmn?.name
        return cell
    }
}

//MARK: - UISearchBar

extension PokedexViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pokemon = pokemon?.filter("name CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "id", ascending: true)
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.count == 0){
            loadPokemon()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
