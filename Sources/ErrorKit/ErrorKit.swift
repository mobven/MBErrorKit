//
//  ErrorKit.swift
//  ErrorKit
//
//  Created by Rasid Ramazanov on 08.06.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import MMBKit

// MARK: - Setup
extension ErrorKit: MBComponent {
    
    public func setup() {
        
    }
    
}

/// Delegation for `ErrorKit` errors.
public protocol ErrorKitDelegate: class {
    /// `ErrorKit` caught a networking error.
    /// - parameter networkingError: Networking error.
    func errorKitDidCatch(networkingError: Error)
    
    /// `ErrorKit` caught a JSON (de-)serialization error.
    /// - parameter serializationError: Serialization error.
    func errorKitDidCatch(serializationError: Error)
    
    /// `ErrorKit` caught an encryption/decryption error.
    /// - parameter cryptographyError: Encryption/decryption error.
    func errorKitDidCatch(cryptographyError: Error)
}

/// Manager for ErrorKit.
public class ErrorKit {
    
    /// `ErrorKit` singleton instance.
    public static let shared: ErrorKit = ErrorKit()
    
    /// Delegation for errors.
    public weak var delegate: ErrorKitDelegate?
    
}
