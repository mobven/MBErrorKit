//
//  ErrorKitTests.swift
//  ErrorKitTests
//
//  Created by Rasid Ramazanov on 08.06.2020.
//  Copyright © 2020 Rasid Ramazanov. All rights reserved.
//

import XCTest
@testable import MBErrorKit

class ErrorKitTests: XCTestCase {
    
    var errorKitDelegate: ErrorKitDelegateSpy!
    
    override func setUp() {
        errorKitDelegate = ErrorKitDelegateSpy()
        ErrorKit.shared().delegate = errorKitDelegate
    }
    
    func testDelegateNetworkingError() {
        let error = NetworkingError.networkConnectionError(
            NSError(domain: "test", code: 2, userInfo: nil)
        )
        ErrorKit.shared().delegate?.errorKitDidCatch(networkingError: error)
        XCTAssertEqual(errorKitDelegate.networkingError?.errorDescription, error.errorDescription)
        XCTAssertEqual(errorKitDelegate.networkingError?.data, error.data)
        XCTAssertEqual(errorKitDelegate.networkingError?.response, error.response)
        XCTAssertEqual(errorKitDelegate.networkingError?.errorTitle, error.errorTitle)
    }
    
    func testDelegateSerializationError() {
        let error = NetworkingError.decodingError(
            NSError(domain: "test", code: 2, userInfo: nil), nil, nil
        )
        ErrorKit.shared().delegate?.errorKitDidCatch(serializationError: error)
        XCTAssertEqual(errorKitDelegate.serializationError?.errorDescription, error.errorDescription)
        XCTAssertEqual(errorKitDelegate.serializationError?.data, error.data)
        XCTAssertEqual(errorKitDelegate.serializationError?.response, error.response)
        XCTAssertEqual(errorKitDelegate.serializationError?.errorTitle, error.errorTitle)
    }
    
    func testDelegateCryptographyError() {
        let error = NSError(domain: "test", code: 2, userInfo: nil)
        ErrorKit.shared().delegate?.errorKitDidCatch(cryptographyError: error)
        XCTAssertEqual(errorKitDelegate.cryptographyError?.localizedDescription, error.localizedDescription)
    }
    
}
