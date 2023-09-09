//
//  NetworkUnitTests.swift
//  SugarRushTests
//
//  Created by Mohammed Jameeluddin on 9/9/23.
//

import XCTest
@testable import SugarRush

final class NetworkUnitTests: XCTestCase {
    
    private var session: URLSession!
    private var url: URL!
    
    override func setUp() {
        url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSessionProtocol.self]
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        url = nil
        session = nil
        super.tearDown()
    }
    
    
    func test_jsonDecodes_success() {
        XCTAssertNoThrow(try JSONMapper.decode(file: "Desserts", type: Desserts.self), "Mapper shouldn't throw an error")
        let response = try? JSONMapper.decode(file: "Desserts", type: Desserts.self)
            XCTAssertNotNil(response, "User response shouldn't be nil")
            XCTAssertEqual(response?.desserts.count, 5)
            XCTAssertEqual(response?.desserts[0].title, "Apam balik")
            XCTAssertEqual(response?.desserts[2].id, "52768")
            XCTAssertEqual(response?.desserts[4].image, "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
    }
    
    
    func test_successfulResponse_code() async throws {
        
        guard let path = Bundle.main.path(forResource: "Desserts", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get the static users file")
            return
        }
        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)
            return (response!, data)
        }
        let dataResponse = try await MockAPIServiceManager.shared.request(session: session,
                                                                          from: "Dummy",
                                                                          type: Desserts.self)
        let staticJSON = try JSONMapper.decode(file: "Desserts",
                                               type: Desserts.self)
        
        XCTAssertEqual(dataResponse.desserts, staticJSON.desserts)
    }
    
    
    func test_unsuccessfulResponse_code() async  {
        let invalidStatusCode = 400
        MockURLSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url,
                                           statusCode: invalidStatusCode,
                                           httpVersion: nil,
                                           headerFields: nil)
            return (response!, nil)
        }
        do {
            _ = try await MockAPIServiceManager.shared.request(session: session,
                                                               from: "Dummy",
                                                               type: Desserts.self)
        } catch {
            guard let networkingError = error as? APIError else {
                XCTFail("Got the wrong type of error, expecting NetworkingManager NetworkingError")
                return
            }
            XCTAssertEqual(networkingError,
                           APIError.invalidStatusCode,
                           "Error should be a networking error which throws an invalid status code")
        }
    }
}
