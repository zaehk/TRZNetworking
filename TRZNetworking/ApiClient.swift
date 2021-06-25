//
//  ApiClient.swift
//  VivinoTest
//
//  Created by Borja Saez de Guinoa Vilaplana on 3/5/21.
//

import Foundation

public final class ApiClient: ApiClientProtocol {
    
    public static let shared = ApiClient()
    
    private init(){
        
    }
    
    private var urlSession: URLSession = {
        let defaultSession = URLSession(configuration: .default)
        return defaultSession
    }()
    
    
    public func makeRequest<T>(callConfig: URLRequestConfiguration,
                        responseModel: T.Type,
                        success: @escaping (T) -> Void,
                        failure: @escaping (APIError) -> Void) where T: Decodable {
        
        guard let request = callConfig.asURLRequest else {
            DispatchQueue.main.async {
                failure(APIError.generalServiceError)
            }
            return
        }
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if error != nil || data == nil {
                DispatchQueue.main.async {
                    failure(APIError.generalServiceError)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (ApiParameters.validationRange).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    failure(APIError.badRequestError)
                }
                return
            }
            
            
            guard let safeData = data else {
                DispatchQueue.main.async {
                    failure(APIError.jsonParsingError)
                }
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let parsedObject = try? jsonDecoder.decode(T.self, from: safeData) {
                DispatchQueue.main.async {
                    success(parsedObject)
                }
            } else {
                DispatchQueue.main.async {
                    failure(APIError.jsonParsingError)
                }
            }
            
        }
        
        dataTask.resume()
        
    }
}
