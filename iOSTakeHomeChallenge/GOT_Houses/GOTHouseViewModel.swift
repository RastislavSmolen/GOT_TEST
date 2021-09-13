//
//  GOTHouseViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 13/09/2021.
//

import Foundation
class GOTHouseViewModel {
    
    var networking : NetworkingProtoccol
    var house = [House]()

    init(networking : NetworkingProtoccol = Networking()) {
        self.networking = networking
    }

    func fetchData(completion: @escaping ((_ data: [House]?,_ err: String?) -> Void)) {
        guard let url = URL(string: APIEndpoit.houses.api()) else { return }
        networking.fetchData(url: url, type: [House].self){ (result) in
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
