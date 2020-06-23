//
//  ErrorKit.swift
//  ErrorKit
//
//  Created by Rasid Ramazanov on 08.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import MobKit

/// Delegation for `ErrorKit` errors.
public protocol ErrorKitDelegate: class {
    /// `ErrorKit` caught a networking error.
    /// - parameter networkingError: Networking error.
    func errorKitDidCatch(networkingError: NetworkingError)
    
    /// `ErrorKit` caught a JSON (de-)serialization error.
    /// - parameter serializationError: Serialization error.
    func errorKitDidCatch(serializationError: NetworkingError)
    
    /// `ErrorKit` caught an encryption/decryption error.
    /// - parameter cryptographyError: Encryption/decryption error.
    func errorKitDidCatch(cryptographyError: Error)
}

/// Manager for ErrorKit.
public class ErrorKit: MobKitComponent {
    
    /// `ErrorKit` singleton instance.
    static var instance: ErrorKit?
    /// `AppSecurity` singleton instance.
    public override class func shared() -> Self {
        if instance == nil {
            self.instance = ErrorKit()
        }
        guard let sharedInstance = self.instance as? Self else {
            fatalError("Could not cast ErrorKit")
        }
        return sharedInstance
    }
    
    override init() {
        super.init()
    }
    
    public override func setup() {
        
    }
    
    /// Delegation for errors.
    public weak var delegate: ErrorKitDelegate?
    
}
