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

/// Manager for ErrorKit.
public class ErrorKit {
    
    /// `ErrorKit` singleton instance.
    public static let shared: ErrorKit = ErrorKit()
    
}
