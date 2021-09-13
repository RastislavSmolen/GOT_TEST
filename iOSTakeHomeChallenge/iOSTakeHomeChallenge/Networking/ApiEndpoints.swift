//
//  ApiEndpoints.swift
//  iOSTakeHomeChallenge
//
//  Created by Rastislav Smolen on 10/09/2021.
//

import Foundation
enum APIEndpoit: String{
    case books = "https://anapioficeandfire.com/api/books"
    case characters = "https://anapioficeandfire.com/api/characters"
    case houses = "https://anapioficeandfire.com/api/houses"
    
    case bookMock = "BooksJsonMockData"
    func api() ->String { return self.rawValue }
}
