//
//  GOTBookViewModel.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 10/09/2021.
//

import Foundation
class GOTBookViewModel {

    var networking : NetworkingProtoccol
    var book = [Book]()

    init(networking : NetworkingProtoccol = Networking()) {
        self.networking = networking
    }

    func fetchData(completion: @escaping ((_ data: [Book]?,_ err: String?) -> Void)) {
        guard let url = URL(string: APIEndpoit.books.api()) else { return }
        networking.fetchData(url: url, type: [Book].self){ (result) in
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
