//
//  HousesViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//

import Foundation
import UIKit

class HousesViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var cachedHouses: [House] = []
    private var model : GOTHouseViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = GOTHouseViewModel()
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
        cachedHouses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell") as! HouseTableViewCell
        cell.setupWith(house: cachedHouses[indexPath.row])
        return cell
    }
}


