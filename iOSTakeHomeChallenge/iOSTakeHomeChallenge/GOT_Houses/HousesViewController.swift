//
//  HousesViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//

import Foundation
import UIKit

class HousesViewController: UIViewController, UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    var cachedHouses: [House] = []
    var filteredHouses: [House] = []
    private var model : GOTHouseViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = GOTHouseViewModel()
        searchBar.delegate = self
        fetchData()
    }
    
    private func fetchData(){
        model?.fetchData { [weak self] (cachedHouses,err) in
            guard let cachedHouses = cachedHouses else { return }
            self?.loadData(houses: cachedHouses)
        }
    }
    
    func loadData(houses: [House]) {
        cachedHouses = houses
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text == "" {
            return cachedHouses.count
        }else {
            return filteredHouses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell") as! HouseTableViewCell
        if searchBar.text == "" {
            cell.setupWith(house: cachedHouses[indexPath.row])
        }else {
            cell.setupWith(house: filteredHouses[indexPath.row])
        }
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredHouses = searchText.isEmpty ? cachedHouses : cachedHouses.filter({(dataString: House) -> Bool in
            return dataString.name.range(of: searchText, options: .caseInsensitive) != nil
        })

        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }
}
