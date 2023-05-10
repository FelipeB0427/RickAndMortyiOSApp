//
//  RMService.swift
//  Rick And Morty App
//
//  Created by Felipe Brigagão de Almeida on 10/05/23.
//

import Foundation

/// Primary API service object to get Rick And Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init () {
        
    }
    
    /// Send Rick And Mortty API Call
    /// - Parameters:
    ///   - request: Request Instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
