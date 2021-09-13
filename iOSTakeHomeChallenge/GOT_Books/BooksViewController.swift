//
//  BooksViewController.swift
//  iOSTakeHomeChallenge
//
//  Created by James Malcolm on 09/03/2021.
//



import Foundation
import UIKit

class BooksViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cachedBooks: [Book] = []
    private var model : GOTBookViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        model = GOTBookViewModel()
        fetchData()
    }
    
    private func fetchData(){
        model?.fetchData { [weak self] (cachedBooks,err) in
            guard let cachedBooks = cachedBooks else { return }
            self?.loadData(books: cachedBooks)
        }
    }
    
    func loadData(books: [Book]) {
        cachedBooks = books
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cachedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell") as! BooksTableViewCell
        cell.setupWith(book: cachedBooks[indexPath.row])
        return cell
    }
    
}


