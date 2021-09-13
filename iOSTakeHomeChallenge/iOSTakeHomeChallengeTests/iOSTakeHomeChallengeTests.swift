//
//  iOSTakeHomeChallengeTests.swift
//  iOSTakeHomeChallengeTests
//
//  Created by Rastislav Smolen on 13/09/2021.
//

import XCTest
@testable import iOSTakeHomeChallenge

// simple test example whit local json file
class iOSTakeHomeChallengeTests: XCTestCase {

    
    var networking = MockNetworking()
    var viewModel : GOTBookViewModel?
    
    override func setUp() {
        viewModel = GOTBookViewModel(networking: networking)
        super.setUp()
    }
    func testFetchDataSuccessScenario(){
        
        viewModel?.fetchData{(results,err) in
            XCTAssertEqual(results?.first?.name,"A Game of Thrones")
            XCTAssertEqual(results?.count,10)
        }
    }
    func testFetchDataFailScenario(){
        
        networking.localJSONFile = "failure"
        viewModel?.fetchData{(results,err) in
            XCTAssertNil(results?.count)
            XCTAssertNil(results?.first?.name)
        }
    }

}
class MockNetworking: NetworkingProtoccol {
    
    var localJSONFile = APIEndpoit.bookMock.api()

    func fetchData<T: Codable>(url: URL, type: T.Type, completionHandler: @escaping (Result<T,NetworkError>) -> Void) {
        
        guard let path = Bundle.main.path(forResource: localJSONFile, ofType: "json") else {
            completionHandler(.failure(NetworkError.malformedLocalizedJsonFile(message: "json file not found/ is not correctly formed")))
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        let jsonData = try? Data(contentsOf: url)
        guard let data = jsonData else {return}
        do {
            let dataSummary = try JSONDecoder().decode(type, from: data)
            completionHandler(.success(dataSummary))
        } catch {
            completionHandler(.failure(NetworkError.parsingFailed(message: "parsing failed")))
        }
    }
}
