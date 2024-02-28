//  HometaskPipedriveTests.swift
//  HometaskPipedriveTests
//  Created by Анастасия Набатова on 22/2/24.

import XCTest
@testable import HometaskPipedrive

final class HometaskPipedriveTests: XCTestCase {
    
    private var service: PersonsService!
    
    override func setUp() {
        service = PersonsService()
    }
    
    func testFetchPersons() async throws {
        
        let expectation = XCTestExpectation(description: "Fetching persons data successfully")
        
        let request = URLRequest(url: URL(string: "https://api.pipedrive.com/v1/persons?api_token=\(ApiConstants.apiKey)")!)
        
        do {
            let response = try await service.fetchPersons(request: request)
            XCTAssertTrue(response.success)
            XCTAssertFalse(response.data.isEmpty)
            expectation.fulfill()
        } catch {
            XCTFail("Error: \(error.localizedDescription)")
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
}

