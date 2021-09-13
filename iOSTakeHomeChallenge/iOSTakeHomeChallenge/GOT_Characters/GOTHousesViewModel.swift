//
//  GOTHousesViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 13/09/2021.
//

import Foundation
class GOTCharacterViewModel {
    
    var networking : NetworkingProtoccol
    var character = [Character]()

    init(networking : NetworkingProtoccol = Networking()) {
        self.networking = networking
    }

    func fetchData(completion: @escaping ((_ data: [Character]?,_ err: String?) -> Void)) {
        guard let url = URL(string: APIEndpoit.characters.api()) else { return }
        networking.fetchData(url: url, type: [Character].self){ (result) in
            switch result {
            case.success(let response): completion( response, nil )
            case.failure(let error): completion( nil, error.localizedDescription )
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
}
