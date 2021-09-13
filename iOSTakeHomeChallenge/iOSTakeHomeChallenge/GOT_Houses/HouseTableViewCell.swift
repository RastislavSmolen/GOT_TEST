//
//  HouseTableViewCell.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 13/09/2021.
//

import Foundation
import UIKit
class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    func setupWith(house: House) {
        let regionsFont = UIFont.systemFont(ofSize: 12)
        let regionsAttributes = [NSAttributedString.Key.font: regionsFont]
        let regionsAttributedString = NSAttributedString(string: String(house.region), attributes: regionsAttributes)
        
        let houseWordsFont = UIFont.italicSystemFont(ofSize: 12)
        let houseWordsAttributes = [NSAttributedString.Key.font: houseWordsFont]
        let houseWordsAttributedString = NSAttributedString(string: String(house.words), attributes: houseWordsAttributes)
        nameLabel.text = house.name
        regionLabel.attributedText = regionsAttributedString
        wordsLabel.attributedText =  houseWordsAttributedString
    }
}
