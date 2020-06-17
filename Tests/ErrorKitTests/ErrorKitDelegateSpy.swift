//
//  ErrorKitDelegateSpy.swift
//  ErrorKit
//
//  Created by Rasid Ramazanov on 17.06.2020.
//  Copyright © 2020 Rasid Ramazanov. All rights reserved.
//

import Foundation

class ErrorKitDelegateSpy: ErrorKitDelegate {
    
    var networkingError: NetworkingError?
    func errorKitDidCatch(networkingError: NetworkingError) {
        self.networkingError = networkingError
    }
    
    var serializationError: NetworkingError?
    func errorKitDidCatch(serializationError: NetworkingError) {
        self.serializationError = serializationError
    }
    
    var cryptographyError: Error?
    func errorKitDidCatch(cryptographyError: Error) {
        self.cryptographyError = cryptographyError
    }
    
}
