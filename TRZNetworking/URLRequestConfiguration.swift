//
//  ApiRouter.swift
//  VivinoTest
//
//  Created by Borja Saez de Guinoa Vilaplana on 3/5/21.
//

import Foundation

public protocol URLRequestConfiguration {
    var method: APIClientMethod {get}
    var path: String {get}
}

extension URLRequestConfiguration {
    
    public var asURLRequest : URLRequest? {
        var urlRequest : URLRequest
        
        guard let url = URL.init(string: path) else {return nil}
                
        //Create urlRequest
        urlRequest = URLRequest(url: url)
        
        //Set method
        urlRequest.httpMethod = method.rawValue
        
        //Remove cache
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        //Set max timeout time
        urlRequest.timeoutInterval = ApiParameters.requestTimeOut
                
        return urlRequest
    }
    
}


