//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by Hariel Giacomuzzi on 03/12/19.
//  Copyright © 2019 HarielGiacomuzzi. All rights reserved.
//

import XCTest
@testable import MarvelApp

class MarvelAppTests: XCTestCase {
    var provider: CharacterProviderProtocol!
    var service: MainListServiceProtocol!

    override func setUp() {
        provider = CharacterProvider(backendService: .QA)
        service = MainListService(provider: provider)
    }

    override func tearDown() {
        provider = nil
        service = nil
    }

    func testGetAllCharacters() {
        let expectation = XCTestExpectation(description: "Wait for service response")
        expectation.expectedFulfillmentCount = 1

        provider.getCharacters(offset: 0, limit: 10) { (result) in
            switch result {
            case .failure(let error):
                expectation.fulfill()
                XCTFail("Failed provider get characters test, details: \(error.localizedDescription)")
            case .success(let characters):
                expectation.fulfill()
                XCTAssertTrue(characters.count == 10)
            }
        }

        wait(for: [expectation], timeout: 15.0)
    }

    func testServiceGetCharacters() {
        let expectation = XCTestExpectation(description: "Wait for service response")
        expectation.expectedFulfillmentCount = 1

        service.getAllHeros { characters in
            expectation.fulfill()
            XCTAssertTrue(characters.count == 50)
        }

        wait(for: [expectation], timeout: 15.0)
    }
}
