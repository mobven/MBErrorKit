//
//  NetworkingError.swift
//  ErrorKit
//
//  Created by Eren Bayrak on 8.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

public enum NetworkingError: Error {
    
    /// Indicates a response failed for cannot connect `Internet Network`.
    case networkConnectionError(Error?)
    
    /// Indicates that request failed while encoding to a `Encodable` object.
    /// Anyway, request were proceeded with `nil` body.
    case encodingError(Error, URLRequest)
    
    /// Indicates that request failed while decoding to a `Decodable` object.
    case decodingError(Error, URLResponse?, Data?)
    
    /// Indicates a response failed with an invalid `HTTP Status Code`.
    case httpError(Error?, HTTPURLResponse, Data?)
    
    /// Indicates a response didn't find `Data`.
    case dataTaskError(URLResponse, Data?)
    
    /// Indicates a response failed due to an underlying `Error`.
    case underlyingError(Error, URLResponse?, Data?)
    
    /// Indicates a response failed unkown`Error`.
    case unkownError(Error?, Data?)

    /// Called when data task is cancelled through `MBNetworking.NetworkableDataTasks.cancellAll()`
    case dataTaskCancelled
}

public extension MBErrorKit.NetworkingError {
    
    /// Title for the error.
    var errorTitle: String {
        switch self {
        case .networkConnectionError: return "Network Connection Error"
        case .encodingError: return "Encoding Error"
        case .decodingError: return "Decoding Error"
        case .httpError: return "HTTP Error"
        case .dataTaskError: return "Data Task Error"
        case .underlyingError: return "Underlying Error"
        case .unkownError: return "Unkown Error"
        case .dataTaskCancelled: return "Data task cancelled"
        }
    }
    
    /// `URLResponse` returned within the error.
    var response: URLResponse? {
        switch self {
        case .networkConnectionError: return nil
        case .encodingError: return nil
        case .decodingError(_, let response, _): return response
        case .httpError(_, let response, _): return response
        case .dataTaskError(let response, _): return response
        case .underlyingError(_, let response, _): return response
        case .unkownError: return nil
        case .dataTaskCancelled: return nil
        }
    }
    
    /// Data returned within the error.
    var data: Data? {
        switch self {
        case .networkConnectionError: return nil
        case .encodingError: return nil
        case .decodingError(_, _, let data): return data
        case .httpError(_, _, let data): return data
        case .dataTaskError(_, let data): return data
        case .underlyingError(_, _, let data): return data
        case .unkownError(_, let data): return data
        case .dataTaskCancelled: return nil
        }
    }
    
    /// Error description.
    var errorDescription: String {
        switch self {
        case .networkConnectionError(let error):
            return "Couldn't connect to internet with error: \(error?.localizedDescription ?? "")"
        case .decodingError(let error, _, _), .encodingError(let error, _):
            return error.localizedDescription
        case .httpError(let error, let response, _):
            return "HTTP error: \(response.statusCode.description), with description: \(error?.localizedDescription ?? "")"
        case .dataTaskError:
            return "Couldn't find data."
        case .underlyingError(let error, _, _):
            return error.localizedDescription
        case .unkownError(let error, _):
            return error?.localizedDescription ?? "Unkown Error"
        case .dataTaskCancelled: return "Data task is cancelled"
        }
    }
    
}
