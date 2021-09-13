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

        let dateFormaterGet = DateFormatter()
        dateFormaterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"

        let date: Date? = dateFormaterGet.date(from: book.released)
        guard let unwrappedDate = date else { return }
        let formatedDate = dateFormatter.string(from: unwrappedDate)

        let pagesFont = UIFont.italicSystemFont(ofSize: 12)
        let pagesAttributes = [NSAttributedString.Key.font: pagesFont]
        let pagesAttributedString = NSAttributedString(string: String(book.numberOfPages) + " pages", attributes: pagesAttributes)

        let datesFont = UIFont.systemFont(ofSize: 14)
        let datesAttributes = [NSAttributedString.Key.font: datesFont]
        let datesAttributedString = NSAttributedString(string: "\(formatedDate)", attributes: datesAttributes)

        titleLabel.text = book.name
        dateLabel.attributedText = datesAttributedString
        pagesLabel.attributedText = pagesAttributedString
    }
}
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
