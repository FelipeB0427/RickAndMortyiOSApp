//
//  RMRequest.swift
//  Rick And Morty App
//
//  Created by Felipe Brigagão de Almeida on 10/05/23.
//

import Foundation


/// Object that represents a singlet API call
final class RMRequest {
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    
    /// Path components for API, if any
    private let pathComponents: Set<String>
    
    /// Query arguments for api Key
    private let queryParameters: [URLQueryItem]
    
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        
        string.append("/")
        string.append(endpoint.rawValue)
        
        if !pathComponents.isEmpty {            
            pathComponents.forEach({
                string.append("/\($0)")
            })
        }
        
        if !queryParameters.isEmpty {
            string.append("?")
            
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string.append(argumentString)
        }
        
        return string
    }
    
    ///Computed & Constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
