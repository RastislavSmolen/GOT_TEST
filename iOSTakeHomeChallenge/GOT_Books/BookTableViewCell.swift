//
//  BookTableViewCell.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 11/09/2021.
//

import Foundation
import UIKit
class BooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    
    func setupWith(book: Book) {
        titleLabel.text = book.name
        dateLabel.text = book.released
        pagesLabel.text =  String(book.numberOfPages)
    }
}
