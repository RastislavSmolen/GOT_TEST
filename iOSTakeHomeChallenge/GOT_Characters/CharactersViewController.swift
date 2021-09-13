//
//  CharactersViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//

import Foundation
import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cachedCharacters: [Character] = []
    var model : GOTCharacterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = GOTCharacterViewModel()
        fetchData()
    }
    
    private func fetchData(){
        model?.fetchData { [weak self] (cachedCharacters,err) in
            guard let cachedCharacters = cachedCharacters else { return }
            self?.loadData(characters: cachedCharacters)
        }
    }
    
    func loadData(characters: [Character]) {
        cachedCharacters = characters
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cachedCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.setupWith(character: cachedCharacters[indexPath.row])
        return cell
    }
}

