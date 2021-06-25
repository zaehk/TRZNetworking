//
//  ApiClientProtocol.swift
//  VivinoTest
//
//  Created by Borja Saez de Guinoa Vilaplana on 3/5/21.
//

import Foundation

public protocol ApiClientProtocol {
    
    /// Launch an api call and parse the data returned from the server
    /// - Parameters:
    ///   - callConfig: basic info needed to perform the call
    ///   - responseModel: response model to which parse the response, must conform to decodable
    ///   - success: response data parsed to the response model
    ///   - failure: failure error with info about the error
    func makeRequest<T>(callConfig: URLRequestConfiguration, responseModel: T.Type, success: @escaping (T) -> Void, failure: @escaping (APIError) -> Void) where T: Decodable
}

public protocol ApiServiceProtocol {
    var apiClient: ApiClientProtocol {get}
}
